//
//  WRElectronicAccountController.m
//  wallet
//
//  Created by xc-ios on 2020/8/7.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRElectronicAccountController.h"
#import "WRElectronicAccountCell.h"
#import "WRElectronicAccountView.h"
#import "WRElectronicAccountHeadView.h"

@interface WRElectronicAccountController ()<UITableViewDelegate , UITableViewDataSource>
/** tableView */
@property(nonatomic , strong)UITableView *tableView;
/** 数据 */
@property(nonatomic , strong)NSArray *datas;

@end

@implementation WRElectronicAccountController

static NSString *kWRElectronicAccountCell = @"kWRElectronicAccountCell";
static NSString *kWRElectronicAccountHeadView = @"kWRElectronicAccountHeadView";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
#pragma mark - 设置UI
- (void)setupUI {
    self.navigationItem.title = @"电子账户";
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
    [_tableView registerClass:[WRElectronicAccountCell class] forCellReuseIdentifier:kWRElectronicAccountCell];
    [_tableView registerClass:[WRElectronicAccountHeadView class] forHeaderFooterViewReuseIdentifier:kWRElectronicAccountHeadView];
    [self.view addSubview:_tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
}
- (void)setupHeadView{
    WRElectronicAccountView *headView = [[WRElectronicAccountView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
    self.tableView.tableHeaderView = headView;
}
#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1 ;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WRElectronicAccountCell *cell = [tableView dequeueReusableCellWithIdentifier:kWRElectronicAccountCell forIndexPath:indexPath];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    WRElectronicAccountHeadView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kWRElectronicAccountHeadView];
    return headView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section  {
    return [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.01)];
}

@end
