//
//  WalletViewController.m
//  wallet
//
//  Created by xc-ios on 2020/7/27.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WalletViewController.h"
#import "WalletSectionModel.h"
#import "WalletRowModel.h"
#import "WalletTopView.h"
#import "NormalTableViewCell.h"
#import "WalletHeaderView.h"
#import "FinancialTableViewCell.h"
#import "ManagerTableViewCell.h"
#import "WalletBottomView.h"
#import "OpenViewController.h"
#import "WRBankCardManagerController.h"
#import "WRRechargeViewController.h"
#import "WRWithdrawViewController.h"
#import "WRAccountManagerController.h"


@interface WalletViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 右侧按钮 */
@property(nonatomic , strong)UIBarButtonItem *rightItem;
/** tableView */
@property(nonatomic , strong)UITableView *tableView;
/** 数据 */
@property(nonatomic , strong)NSArray *walletData;
/** 顶部视图 */
@property(nonatomic , strong)WalletTopView *headView;
/** 底部试题 */
@property(nonatomic , strong)WalletBottomView *bottomView;





@end

@implementation WalletViewController

static NSString *kNormalTableViewCell = @"kNormalTableViewCell";
static NSString *kWalletHeaderView = @"kWalletHeaderView";
static NSString *kFinancialTableViewCell = @"kFinancialTableViewCell";
static NSString *kManagerTableViewCell = @"kManagerTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isHaveWallet = false;
    [self setupUI];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadData];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
       make.left.right.top.offset(0);
       make.bottom.offset(self.isHaveWallet?-60:-150);
    }];
    [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
          make.left.right.bottom.offset(0);
          make.height.offset(self.isHaveWallet?60:150);
    }];
    
}
#pragma mark - 设置UI
- (void)setupUI {
    [self setupCurrentNav];
    [self setupBottomView];
    [self initTableView];
    [self setupTopView];
    
}
- (void)setupCurrentNav {
    self.navigationItem.title = @"钱包";
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"账单" style:UIBarButtonItemStyleDone target:self action:@selector(rightBtnClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void )initTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = kBgColor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = false;
    _tableView.showsHorizontalScrollIndicator = false;
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[NormalTableViewCell class] forCellReuseIdentifier:kNormalTableViewCell];
    [_tableView registerClass:[WalletHeaderView class] forHeaderFooterViewReuseIdentifier:kWalletHeaderView];
    [_tableView registerClass:[FinancialTableViewCell class] forCellReuseIdentifier:kFinancialTableViewCell];
    [_tableView registerClass:[ManagerTableViewCell class] forCellReuseIdentifier:kManagerTableViewCell];
    [self.view addSubview:_tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.bottom.offset(self.isHaveWallet?-60:-150);
    }];
}

- (void)setupTopView {
    WalletTopView *headView = [[WalletTopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    self.headView = headView;
    self.tableView.tableHeaderView = headView;
}
- (void)setupBottomView {
    WalletBottomView *bottomView = [[WalletBottomView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    self.bottomView = bottomView;
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.offset(self.isHaveWallet?60:150);
    }];
    bottomView.openClickBlock = ^{
        OpenViewController *openVc = [[OpenViewController alloc] init];
        [self.navigationController pushViewController:openVc animated:true];
    };
}
#pragma mark - 事件
//账单
- (void)rightBtnClick {
    
    
}
#pragma mark - 加载数据
- (void)loadData {
    self.walletData = [WalletSectionModel loadWalletDatas:self.isHaveWallet];
    self.headView.isHaveWallet = self.isHaveWallet;
    self.bottomView.isHaveWallet = self.isHaveWallet;
    [self.tableView reloadData];
    
}
#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.walletData.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    WalletSectionModel *sectionModel = self.walletData[section];
    if (sectionModel.sectionType == WalletSectionFinanceType || sectionModel.sectionType == WalletSectionManagerType) {
        return 1;
    }
    return sectionModel.rowDatas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WalletSectionModel *sectionModel = self.walletData[indexPath.section];
    if (sectionModel.sectionType == WalletSectionFinanceType ) {
        FinancialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kFinancialTableViewCell forIndexPath:indexPath];
        cell.financialClickBlock = ^(BOOL isSaveMonery) {
            if (isSaveMonery) {
                //去添金宝页面
                WALog(@"点击去添金宝页面");
                return ;
            }
            //去众惠存界面
            WALog(@"点击去众惠存界面");
        };
        return cell;
        
    }
    if (sectionModel.sectionType ==  WalletSectionManagerType) {
        ManagerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kManagerTableViewCell forIndexPath:indexPath];
        cell.sectionModel = sectionModel;
        
        cell.managerBlock = ^(WalletRowModel * _Nonnull rowModel) {
            //去具体的页面
             WALog(@"点击去具体页面");
            if (rowModel.rowTag == 1005) {
                WRBankCardManagerController  *cardManagerVc = [[WRBankCardManagerController alloc] init];
                [self.navigationController pushViewController:cardManagerVc animated:true];
            }
        };
        
        return cell;
    }
    NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNormalTableViewCell forIndexPath:indexPath];
    cell.rowModel = sectionModel.rowDatas[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
     WalletSectionModel *sectionModel = self.walletData[indexPath.section];
    WalletRowModel *rowModel =  sectionModel.rowDatas[indexPath.row];
    if (rowModel.rowTag == 1001) {
        WRRechargeViewController * rechargeVc = [[WRRechargeViewController alloc] init];
        [self.navigationController pushViewController:rechargeVc animated:true];
        return;
    }
    if (rowModel.rowTag == 1002) {
           WRWithdrawViewController *withdrawVc = [[WRWithdrawViewController alloc] init];
           [self.navigationController pushViewController:withdrawVc animated:true];
       }
    
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    WalletSectionModel *sectionModel = self.walletData[indexPath.section];
   if (sectionModel.sectionType == WalletSectionManagerType) {
       return 85;
   }
    if (sectionModel.sectionType == WalletSectionFinanceType  ) {
      return 110;
    }
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    WalletSectionModel *sectionModel = self.walletData[section];
   if (sectionModel.sectionType == WalletSectionFinanceType || sectionModel.sectionType == WalletSectionManagerType) {
       return 30;
   }
    return 0.01;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    WalletSectionModel *sectionModel = self.walletData[section];
    if (sectionModel.sectionType == WalletSectionFinanceType || sectionModel.sectionType == WalletSectionManagerType) {
        WalletHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kWalletHeaderView];
         WalletSectionModel *sectionModel = self.walletData[section];
        headView.sectionModel  = sectionModel;
        headView.walletHeaderBlock = ^(WalletSectionModel * _Nonnull sectionModel) {
            WALog(@"点击头部视图");
            if (sectionModel.sectionType == WalletSectionFinanceType) {
                WRAccountManagerController *accVc = [[WRAccountManagerController alloc] init];
                [self.navigationController pushViewController:accVc animated:true];
            }
        };
        return headView;
    }
    
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.01)];
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section  {
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.01)];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    WALog(@"scrollView = %@" , NSStringFromCGPoint(scrollView.contentOffset));
    if (scrollView.contentOffset.y <= 0) {
        scrollView.contentOffset = CGPointMake(0, 0);
    }
}

@end
