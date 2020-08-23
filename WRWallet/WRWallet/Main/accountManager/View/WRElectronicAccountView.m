//
//  WRElectronicAccountView.m
//  wallet
//
//  Created by xc-ios on 2020/8/7.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRElectronicAccountView.h"
@interface WRElectronicAccountView ()
/** 价格 */
@property(nonatomic , strong)UILabel *moneryLabel;

@end

@implementation WRElectronicAccountView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    
    UIImageView *bgImageView = [ViewCreate createImageViewFrame:CGRectZero image:@"Resources.bundle/account_bg_icon.png"];
    [self addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.offset(-15);
        make.top.offset(15);
        make.bottom.offset(-15);
    }];
    bgImageView.clipsToBounds = true;
    bgImageView.layer.cornerRadius = 10;
    
    UIButton *billBtn = [ViewCreate createButtonFrame:CGRectZero title:@"账单" titleColor:KColor_33 font:kFont_R_13 backgroundColor:kWhirtColor];
    [bgImageView addSubview:billBtn];
    [billBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(35);
        make.top.offset(26);
        make.width.offset(40);
        make.height.offset(20);
    }];
    billBtn.layer.cornerRadius = 5;
    billBtn.clipsToBounds = true;
    [billBtn addTarget:self action:@selector(billBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *moneryLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"88.00" textColor:kWhirtColor textAlignment:kTextAlignmentCenter font:kFont_24];
    [bgImageView addSubview:moneryLabel];
    [moneryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.centerY.offset(10);
    }];
    self.moneryLabel = moneryLabel;
    UILabel *hintLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"￥" textColor:kWhirtColor textAlignment:kTextAlignmentRight font:kFont_16];
    [bgImageView addSubview:hintLabel];
    [hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(moneryLabel.mas_bottom).offset(-3);
        make.right.equalTo(moneryLabel.mas_left);
    }];
    
    UIButton *withdrawBtn = [ViewCreate createButtonFrame:CGRectZero title:@"提现" titleColor:kWhirtColor font:kFont_R_10 backgroundColor:kClearColor];
    [bgImageView addSubview:withdrawBtn];
    [withdrawBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.bottom.offset(-15);
        make.width.offset(40);
        make.height.offset(20);
    }];
    withdrawBtn.clipsToBounds = true;
    withdrawBtn.layer.cornerRadius = 5;
    withdrawBtn.layer.borderColor = kWhirtColor.CGColor;
    withdrawBtn.layer.borderWidth = 0.5;
    [withdrawBtn addTarget:self action:@selector(withdrawBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *rechargeBtn = [ViewCreate createButtonFrame:CGRectZero title:@"充值" titleColor:kWhirtColor font:kFont_R_10 backgroundColor:kClearColor];
    [bgImageView addSubview:rechargeBtn];
    [rechargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(withdrawBtn.mas_left).offset(-5);
        make.bottom.offset(-15);
        make.width.offset(40);
        make.height.offset(20);
    }];
    rechargeBtn.clipsToBounds = true;
    rechargeBtn.layer.cornerRadius = 5;
    rechargeBtn.layer.borderColor = kWhirtColor.CGColor;
    rechargeBtn.layer.borderWidth = 0.5;
    [rechargeBtn addTarget:self action:@selector(rechargeBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)billBtnClick {
    
}
- (void)rechargeBtnClick {
    
}
- (void)withdrawBtnClick {
    
}


@end
