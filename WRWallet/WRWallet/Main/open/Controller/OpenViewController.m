//
//  OpenViewController.m
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "OpenViewController.h"
#import "OpenInputModel.h"
#import "OpenInputTableViewCell.h"
#import "OpenSwitchTableViewCell.h"
#import "OpenProtocolViewController.h"

@interface OpenViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 数据 */
@property(nonatomic , strong)NSArray *inputDatas;
/** tableView */
@property(nonatomic , strong)UITableView *tableView;

@end

@implementation OpenViewController

static NSString *kOpenInputTableViewCell = @"kOpenInputTableViewCell";
static NSString *kOpenSwitchTableViewCell = @"kOpenSwitchTableViewCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self loadData];
}
- (void)setupUI {
    self.navigationItem.title = @"开通";
    [self initTableView];
    [self setupBottomView];
}

- (void )initTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = kBgColor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[OpenInputTableViewCell class] forCellReuseIdentifier:kOpenInputTableViewCell];
    [_tableView registerClass:[OpenSwitchTableViewCell class] forCellReuseIdentifier:kOpenSwitchTableViewCell];
    [self.view addSubview:_tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset(0);
    }];
}
- (void)setupBottomView {
    UIView *bottomView = [ViewCreate createViewFrame:CGRectMake(0, 0, SCREEN_WIDTH, 260) backgroundColor:kWhirtColor];
    UIButton *openBtn = [ViewCreate createButtonFrame:CGRectZero title:@"立即开通" titleColor:kWhirtColor font:kFont_16 backgroundColor:kThemeColor];
    [bottomView addSubview:openBtn];
    [openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-40);
        make.left.offset(22);
        make.right.offset(-22);
        make.height.offset(40);
    }];
    openBtn.clipsToBounds = true;
    openBtn.layer.cornerRadius = 20;
    [openBtn addTarget:self action:@selector(openBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableFooterView = bottomView;
}
#pragma mark - 事件
- (void)openBtnClick {
    OpenProtocolViewController *openProVc = [[OpenProtocolViewController alloc] init];
    [self.navigationController pushViewController:openProVc animated:true];
    
}
#pragma mark - 加载数据
- (void)loadData {
    self.inputDatas = [OpenInputModel loadOpenInputDatas];
    [self.tableView reloadData];
}
#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.inputDatas.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = self.inputDatas[section];
    return arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     NSArray *arr = self.inputDatas[indexPath.section];
    OpenInputModel *model = arr[indexPath.row];
    if (model.type == OpenInputSwitchType) {
        OpenSwitchTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:kOpenSwitchTableViewCell forIndexPath:indexPath];
        cell.inputModel = model;
        return cell;
    }
    OpenInputTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kOpenInputTableViewCell forIndexPath:indexPath];
    cell.inputModel = model;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
    return 5.0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section  {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 5.0)];
    view.backgroundColor = kLineColor;
    return view;
}

@end
