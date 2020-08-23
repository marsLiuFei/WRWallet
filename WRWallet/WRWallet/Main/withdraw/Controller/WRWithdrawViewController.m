//
//  WRWithdrawViewController.m
//  wallet
//
//  Created by xc-ios on 2020/8/4.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRWithdrawViewController.h"
#import "WRWithdrawNormalCell.h"
#import "WRWithdrawInputCell.h"
#import "WRWithdrawPasswordViewController.h"

@interface WRWithdrawViewController ()<UITableViewDelegate , UITableViewDataSource>
/** tableView */
@property(nonatomic , strong)UITableView *tableView;

@end

@implementation WRWithdrawViewController

static NSString *kWRWithdrawNormalCell = @"kWRWithdrawNormalCell";
static NSString *kWRWithdrawInputCell = @"kWRWithdrawInputCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
#pragma mark - 设置UI
- (void)setupUI {
    self.navigationItem.title = @"提现";
    [self initTableView];
    [self setupBottomView];
}

- (void )initTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = kBgColor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[WRWithdrawNormalCell class] forCellReuseIdentifier:kWRWithdrawNormalCell];
    [_tableView registerClass:[WRWithdrawInputCell self] forCellReuseIdentifier:kWRWithdrawInputCell];
    [self.view addSubview:_tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset(0);
    }];
}

- (void)setupBottomView{
    UIView *bottomView = [ViewCreate createViewFrame:CGRectMake(0, 0, SCREEN_WIDTH, 240) backgroundColor:kWhirtColor];
   UIButton *sureBtn = [ViewCreate createButtonFrame:CGRectZero title:@"确认提现" titleColor:kWhirtColor font:kFont_16 backgroundColor:kThemeColor];
   [bottomView addSubview:sureBtn];
   [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.bottom.offset(-40);
       make.left.offset(22);
       make.right.offset(-22);
       make.height.offset(40);
   }];
    
   sureBtn.clipsToBounds = true;
   sureBtn.layer.cornerRadius = 20;
   [sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
   self.tableView.tableFooterView = bottomView;
}
#pragma mark - 事件
- (void)sureBtnClick {
    WRWithdrawPasswordViewController *pasVc = [[WRWithdrawPasswordViewController alloc] init];
    [self.navigationController pushViewController:pasVc animated:true];
   
}
#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        WRWithdrawNormalCell *cell =  [tableView dequeueReusableCellWithIdentifier:kWRWithdrawNormalCell forIndexPath:indexPath];
        return cell;
    }
    WRWithdrawInputCell *cell = [tableView dequeueReusableCellWithIdentifier:kWRWithdrawInputCell forIndexPath:indexPath];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 50;
    }
    return 125;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.01)];
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section  {
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.01)];
}


@end
