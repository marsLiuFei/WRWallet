//
//  WRBankCardChangeFailController.m
//  wallet
//
//  Created by xc-ios on 2020/7/29.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRBankCardChangeFailController.h"

@interface WRBankCardChangeFailController ()

@end

@implementation WRBankCardChangeFailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}
#pragma mark - 设置UI
- (void)setupUI {
    self.navigationItem.title = @"变更失败";
    UIImageView *failImageView = [ViewCreate createImageViewFrame:CGRectZero image:@"Resources.bundle/error_icon.png"];
    [self.view addSubview:failImageView];
    [failImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(0.4);
        make.width.height.offset(64);
    }];
    UILabel *hintLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"卡号变更失败！" textColor:kColor_33 textAlignment:kTextAlignmentCenter font:kFont_21];
    [self.view addSubview:hintLabel];
    [hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.left.right.offset(0);
        make.top.equalTo(failImageView.mas_bottom).offset(30);
    }];
    UILabel *serviceHintLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kWhirtColor text:@"请联系客服" textColor:kColor_33 textAlignment:kTextAlignmentCenter font:kFont_R_14];
    [self.view addSubview:serviceHintLabel];
    [serviceHintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hintLabel.mas_bottom).offset(10);
        make.left.right.offset(0);
    }];
    UILabel *serviceCallHintLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kWhirtColor text:@"客服电话：1551-56568888" textColor:kColor_33 textAlignment:kTextAlignmentCenter font:kFont_R_14];
    [self.view addSubview:serviceCallHintLabel];
    [serviceCallHintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(serviceHintLabel.mas_bottom).offset(15);
        make.left.right.offset(0);
    }];
    UIButton *backBtn = [ViewCreate createButtonFrame:CGRectZero title:@"返回" titleColor:kWhirtColor font:kFont_16 backgroundColor:kThemeColor];
    [self.view addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(serviceCallHintLabel.mas_bottom).offset(60);
        make.left.offset(22);
        make.right.offset(-22);
        make.height.offset(40);
    }];
    backBtn.clipsToBounds = true;
    backBtn.layer.cornerRadius = 20;
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)backBtnClick {
    for (UIViewController *currentVc in self.navigationController.viewControllers) {
        if ([currentVc isKindOfClass:NSClassFromString(@"WalletViewController")]) {
            [self.navigationController popToViewController:currentVc animated:true];
        }
    }
}

@end
