//
//  WRRechargeViewController.m
//  wallet
//
//  Created by xc-ios on 2020/8/4.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRRechargeViewController.h"
#import "WRRechargeNormalCell.h"
#import "WRRechargeInputCell.h"
#import "WRPayAlertView.h"
#import "WRPayPasswordAlertView.h"
#import "WRRechargeSuccessView.h"

@interface WRRechargeViewController ()<UITableViewDelegate , UITableViewDataSource>
/** tableView */
@property(nonatomic , strong)UITableView *tableView;

@end

@implementation WRRechargeViewController

static NSString *kWRRechargeNormalCell = @"kWRRechargeNormalCell";
static NSString *kWRRechargeInputCell = @"kWRRechargeInputCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
#pragma mark - 设置UI
- (void)setupUI {
    self.navigationItem.title = @"充值";
    [self initTableView];
    [self setupBottomView];
}

- (void )initTableView{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = kBgColor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[WRRechargeNormalCell class] forCellReuseIdentifier:kWRRechargeNormalCell];
    [_tableView registerClass:[WRRechargeInputCell self] forCellReuseIdentifier:kWRRechargeInputCell];
    [self.view addSubview:_tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset(0);
    }];
}

- (void)setupBottomView{
    UIView *bottomView = [ViewCreate createViewFrame:CGRectMake(0, 0, SCREEN_WIDTH, 240) backgroundColor:kWhirtColor];
   UIButton *sureBtn = [ViewCreate createButtonFrame:CGRectZero title:@"确认充值" titleColor:kWhirtColor font:kFont_16 backgroundColor:kThemeColor];
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
    WRPayAlertView *alertView = [[WRPayAlertView alloc] initWithFrame:self.view.bounds];
    [alertView createPayView:@"100"];
    alertView.paySureBlock = ^{
        //充值
        [self payPasswordAlertView];
    };
    [self.view addSubview:alertView];
}
- (void)payPasswordAlertView {
    //充值
   WRPayPasswordAlertView * alertView = [[WRPayPasswordAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
   [alertView createPayPasswordAlertView];
    alertView.finsihInputPassBlock = ^(NSString * _Nonnull passStr) {
        //输入完密码，可以验证。
        if ([passStr isEqualToString:@"123456"]) {
            WRRechargeSuccessView *successView = [[WRRechargeSuccessView alloc] initWithFrame:self.view.bounds];
            successView.backgroundColor = kWhirtColor;
            successView.backBlock = ^{
                [self.navigationController popViewControllerAnimated:true];
            };
            [self.view addSubview:successView];
        }else {
            [self alertErrView];
        }
        
    };
    //忘记密码
    alertView.forgetPassBlock = ^{
        
    };
   [[UIApplication sharedApplication].keyWindow addSubview:alertView];
}
- (void)alertErrView {
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"" message:@"银行卡余额不足" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVc addAction:cancleAction];
    [self presentViewController:alertVc animated:true completion:nil];
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
        WRRechargeNormalCell *cell =  [tableView dequeueReusableCellWithIdentifier:kWRRechargeNormalCell forIndexPath:indexPath];
        return cell;
    }
    WRRechargeInputCell *cell = [tableView dequeueReusableCellWithIdentifier:kWRRechargeInputCell forIndexPath:indexPath];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 50;
    }
    return 95;
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
