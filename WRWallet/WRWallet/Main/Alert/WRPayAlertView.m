//
//  WRPayAlertView.m
//  wallet
//
//  Created by xc-ios on 2020/8/4.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRPayAlertView.h"



@implementation WRPayAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (void)createPayView:(NSString *)moneryStr {
    UIView *maskView = [ViewCreate createViewFrame:self.bounds backgroundColor:kBlackColor];
    maskView.alpha = 0.5;
    [self addSubview:maskView];
    
    UIView *bottomAlertView = [ViewCreate createViewFrame:CGRectZero backgroundColor:kWhirtColor];
    [self addSubview:bottomAlertView];
    [bottomAlertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.offset(280 + kSafeAreaHeight);
    }];
    UILabel *titleLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"付款详情" textColor:KColor_33 textAlignment:kTextAlignmentCenter font:kFont_R_14];
    [bottomAlertView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(15);
        make.centerX.offset(0);
    }];
    UIButton *closeBtn = [ViewCreate createButtonFrame:CGRectZero title:@"X" titleColor:KColor_33 font:kFont_R_16 backgroundColor:kClearColor];
    [bottomAlertView addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.centerY.equalTo(titleLabel.mas_centerY);
    }];
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIView *lineView = [ViewCreate createViewFrame:CGRectZero backgroundColor:kLineColor];
     [bottomAlertView addSubview:lineView];
     [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.right.offset(0);
         make.top.equalTo(titleLabel.mas_bottom).offset(8);
         make.height.offset(1);
     }];
    UILabel *moneryLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"￥100.00" textColor:KColor_33 textAlignment:kTextAlignmentCenter font:kMediumFont(24)];
    [bottomAlertView addSubview:moneryLabel];
    [moneryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(lineView.mas_bottom).offset(30);
    }];
    UILabel *infoHintLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"订单信息" textColor:KColor_66 textAlignment:kTextAlignmentLeft font:kFont_R_14];
    [bottomAlertView addSubview:infoHintLabel];
    [infoHintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.equalTo(moneryLabel.mas_bottom).offset(15);
    }];
    UILabel *infoLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"充值" textColor:KColor_33 textAlignment:kTextAlignmentRight font:kFont_R_14];
    [bottomAlertView addSubview:infoLabel];
    [infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.centerY.equalTo(infoHintLabel.mas_centerY);
    }];
    UIButton *payBtn = [ViewCreate createButtonFrame:CGRectZero title:@"立即付款" titleColor:kWhirtColor font:kFont_16 backgroundColor:kThemeColor];
    [bottomAlertView addSubview:payBtn];
    [payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(infoLabel.mas_bottom).offset(30);
        make.left.offset(22);
        make.right.offset(-22);
        make.height.offset(40);
    }];
    payBtn.clipsToBounds = true;
    payBtn.layer.cornerRadius = 20;
    [payBtn addTarget:self action:@selector(payBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)closeBtnClick {
    [self removeFromSuperview];
}
- (void)payBtnClick {
    if (self.paySureBlock) {
        self.paySureBlock();
    }
    [self removeFromSuperview];
    
}

@end
