//
//  WRBankCardNewNumberController.m
//  wallet
//
//  Created by xc-ios on 2020/7/29.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRBankCardNewNumberController.h"
#import "WRBankCardChangeSuccessController.h"
#import "WRBankCardChangeFailController.h"

@interface WRBankCardNewNumberController ()<UITextFieldDelegate>
/** 新银行卡号 */
@property(nonatomic , strong)UITextField *bankCardField;


@end

@implementation WRBankCardNewNumberController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
- (void)setupUI {
    self.navigationItem.title = @"新银行卡";
    self.view.backgroundColor = [UIColor getColor:@"#F8F8F8"];
    UIView *inputView = [ViewCreate createViewFrame:CGRectZero backgroundColor:kWhirtColor];
    [self.view addSubview:inputView];
    [inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.height.offset(45);
    }];
    UILabel *titleLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"银行卡号" textColor:KColor_33 textAlignment:kTextAlignmentLeft font:kFont_R_16];
    [inputView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.bottom.offset(0);
        make.width.offset(80);
    }];
    
    UITextField *inputField = [ViewCreate createTextFieldFrame:CGRectZero font:kFont_R_16 textColor:kColor_33 placeHolder:@"请输入新的银行卡号" delegate:self];
    [inputView addSubview:inputField];
    self.bankCardField = inputField;
    [inputField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(titleLabel.mas_right);
        make.right.offset(-15);
    }];
    inputField.keyboardType = UIKeyboardTypeNumberPad;
    
    UIButton *sureChangeBtn = [ViewCreate createButtonFrame:CGRectZero title:@"确认变更" titleColor:kWhirtColor font:kFont_16 backgroundColor:kThemeColor];
    [self.view addSubview:sureChangeBtn];
    [sureChangeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(inputView.mas_bottom).offset(70);
        make.left.offset(22);
        make.right.offset(-22);
        make.height.offset(40);
    }];
    sureChangeBtn.clipsToBounds = true;
    sureChangeBtn.layer.cornerRadius = 20;
    [sureChangeBtn addTarget:self action:@selector(sureChangeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)sureChangeBtnClick {
    if ([self.bankCardField.text isEqualToString:@"1"]) {
        WRBankCardChangeSuccessController *successVc = [[WRBankCardChangeSuccessController alloc] init];
        [self.navigationController pushViewController:successVc animated:true];
        return;
    }
    WRBankCardChangeFailController *failVc = [[WRBankCardChangeFailController alloc] init];
    [self.navigationController pushViewController:failVc animated:true];
    
}
@end
