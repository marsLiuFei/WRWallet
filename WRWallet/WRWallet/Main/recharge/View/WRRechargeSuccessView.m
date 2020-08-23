//
//  WRRechargeSuccessView.m
//  wallet
//
//  Created by xc-ios on 2020/8/4.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRRechargeSuccessView.h"

@implementation WRRechargeSuccessView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
#pragma mark - setupUI
- (void)setupUI {
    UIImageView *successImageView = [ViewCreate createImageViewFrame:CGRectZero image:@"Resources.bundle/success_icon.png"];
   [self addSubview:successImageView];
   [successImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.centerX.offset(0);
       make.centerY.equalTo(self.mas_centerY).multipliedBy(0.4);
       make.width.height.offset(64);
   }];
   UILabel *hintLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"充值成功！" textColor:kColor_33 textAlignment:kTextAlignmentCenter font:kFont_21];
   [self addSubview:hintLabel];
   [hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.centerX.offset(0);
       make.left.right.offset(0);
       make.top.equalTo(successImageView.mas_bottom).offset(30);
   }];
   UIButton *backBtn = [ViewCreate createButtonFrame:CGRectZero title:@"返回" titleColor:kWhirtColor font:kFont_16 backgroundColor:kThemeColor];
   [self addSubview:backBtn];
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
    if (self.backBlock) {
        self.backBlock();
    }
    [self removeFromSuperview];
}
@end
