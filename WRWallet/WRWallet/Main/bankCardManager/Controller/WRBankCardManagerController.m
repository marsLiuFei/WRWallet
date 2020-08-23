//
//  WRBankCardManagerController.m
//  wallet
//
//  Created by xc-ios on 2020/7/29.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRBankCardManagerController.h"
#import "WRBankCardManagerHeadView.h"
#import "WRBankCardManagerCell.h"
#import "WRUntieBankCardViewController.h"
#import "WRBankCardChangeController.h"

@interface WRBankCardManagerController ()<UITableViewDelegate , UITableViewDataSource>
/** tableView */
@property(nonatomic , strong)UITableView *tableView;
/** 数据 */
@property(nonatomic , strong)NSArray *datas;

@end

@implementation WRBankCardManagerController


static NSString *kWRBankCardManagerCell = @"kWRBankCardManagerCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self loadData];
    
}
#pragma mark - 设置UI
- (void)setupUI {
    self.navigationItem.title = @"银行卡管理";
    [self initTableView];
    [self setupHeadView];
}
- (void )initTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = kBgColor;
    _tableView.showsVerticalScrollIndicator = false;
    _tableView.showsHorizontalScrollIndicator = false;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[WRBankCardManagerCell class] forCellReuseIdentifier:kWRBankCardManagerCell];
    [self.view addSubview:_tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}
- (void)setupHeadView{
    WRBankCardManagerHeadView *headView = [[WRBankCardManagerHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
    self.tableView.tableHeaderView = headView;
}
#pragma mark - 加载数据
- (void)loadData{
    self.datas = @[@"变更绑定卡",@"解除绑定卡"];
    [self.tableView reloadData];
}
#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1 ;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WRBankCardManagerCell *cell = [tableView dequeueReusableCellWithIdentifier:kWRBankCardManagerCell forIndexPath:indexPath];
    cell.titleLabel.text = self.datas[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 1) {
        WRUntieBankCardViewController *untieVc = [[WRUntieBankCardViewController alloc] init];
        [self.navigationController pushViewController:untieVc animated:true];
        return;
    }
    if (indexPath.row == 0) {
        WRBankCardChangeController *changeVc = [[WRBankCardChangeController alloc] init];
        [self.navigationController pushViewController:changeVc animated:true];
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
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
