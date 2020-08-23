//
//  WRBankCardManagerHeadView.m
//  wallet
//
//  Created by xc-ios on 2020/7/29.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRBankCardManagerHeadView.h"

@interface WRBankCardManagerHeadView ()
/** 银行标题 */
@property(nonatomic , strong)UILabel *titleLabel;
/** 子标题 */
@property(nonatomic , strong)UILabel *subLabel;
/** 卡号 */
@property(nonatomic , strong)UILabel *cardNumberLabel;


@end

@implementation WRBankCardManagerHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    
    UIImageView *bgImageView = [ViewCreate createImageViewFrame:CGRectZero image:@"Resources.bundle/manage_bg_icon.png"];
    [self addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.offset(-15);
        make.top.offset(15);
        make.bottom.offset(-15);
    }];
    UIImageView *logoImageView = [ViewCreate createImageViewFrame:CGRectZero image:@"manage_logo_icon"];
    [bgImageView addSubview:logoImageView];
    [logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(15);
        make.height.width.offset(52);
    }];
    UILabel *titleLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"交通银行" textColor:kWhirtColor textAlignment:kTextAlignmentLeft font:kFont_16];
    [bgImageView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(logoImageView.mas_right).offset(10);
        make.right.offset(-15);
        make.centerY.equalTo(logoImageView.mas_centerY).offset(-8);
    }];
    self.titleLabel = titleLabel;
    UILabel *subLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"储蓄卡" textColor:kWhirtColor textAlignment:kTextAlignmentLeft font:kFont_R_13];
    [bgImageView addSubview:subLabel];
    [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel.mas_left);
        make.top.equalTo(titleLabel.mas_bottom);
        make.right.offset(-15);
    }];
    self.subLabel = subLabel;
    UILabel *cardNumberLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"**** **** **** 7709" textColor:kWhirtColor textAlignment:kTextAlignmentLeft font:kFont_18];
    [bgImageView addSubview:cardNumberLabel];
    [cardNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo(subLabel.mas_left);
        make.top.equalTo(subLabel.mas_bottom).offset(15);
       make.right.offset(-15);
    }];
    self.cardNumberLabel = cardNumberLabel;
    
}

@end
