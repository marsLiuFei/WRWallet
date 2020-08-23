//
//  WRBankCardChangeSuccessController.m
//  wallet
//
//  Created by xc-ios on 2020/7/29.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRBankCardChangeSuccessController.h"

@interface WRBankCardChangeSuccessController ()

@end

@implementation WRBankCardChangeSuccessController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
#pragma mark - 设置UI
- (void)setupUI {
    self.navigationItem.title = @"变更成功";
    UIImageView *successImageView = [ViewCreate createImageViewFrame:CGRectZero image:@"Resources.bundle/success_icon.png"];
    [self.view addSubview:successImageView];
    [successImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(0.4);
        make.width.height.offset(64);
    }];
    UILabel *hintLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"卡号变更成功！" textColor:kColor_33 textAlignment:kTextAlignmentCenter font:kFont_21];
    [self.view addSubview:hintLabel];
    [hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.left.right.offset(0);
        make.top.equalTo(successImageView.mas_bottom).offset(30);
    }];
    UIButton *backBtn = [ViewCreate createButtonFrame:CGRectZero title:@"返回" titleColor:kWhirtColor font:kFont_16 backgroundColor:kThemeColor];
    [self.view addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(hintLabel.mas_bottom).offset(60);
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
