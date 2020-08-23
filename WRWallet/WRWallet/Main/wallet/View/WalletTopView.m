//
//  WalletTopView.m
//  wallet
//
//  Created by xc-ios on 2020/7/27.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WalletTopView.h"

@interface WalletTopView ()
/** 钱 */
@property(nonatomic , strong)UILabel *moneryLabel;
/** 份额 */
@property(nonatomic , strong)UILabel *shareLable;
/** 余额 */
@property(nonatomic , strong)UILabel *balanceLabel;
/** 冻结 */
@property(nonatomic , strong)UILabel *freezeLabel;
/** 待结算余额 */
@property(nonatomic , strong)UILabel *settlementLabel;
/** 底部试题 */
@property(nonatomic , strong)UIView *bottomView;


@end

@implementation WalletTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        
    }
    return self;
}
- (void)setIsHaveWallet:(BOOL)isHaveWallet {
    _isHaveWallet = isHaveWallet;
    self.bottomView.hidden = !isHaveWallet;
}
#pragma mark - 设置UI
- (void)setupUI {
    self.backgroundColor = kThemeColor;
    UILabel *moneryLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"88.00" textColor:kWhirtColor textAlignment:kTextAlignmentCenter font:kFont_40];
    [self addSubview:moneryLabel];
    [moneryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.centerY.equalTo(self.mas_centerY).multipliedBy(0.6);
    }];
    self.moneryLabel = moneryLabel;
    UILabel *hintLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"总余额(元)" textColor:kWhirtColor textAlignment:kTextAlignmentCenter font:kFont_16];
    [self addSubview:hintLabel];
    [hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(moneryLabel.mas_bottom);
        make.centerX.offset(0);
    }];
    UIView *bottomView = [ViewCreate createViewFrame:CGRectZero backgroundColor:kClearColor];
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.offset(80);
    }];
    CGFloat width = SCREEN_WIDTH * 0.25;
    UIView *shareView = [self createViewWithHintTitle:@"账户份额" labTag:1001 isSpaceLine:true superView:bottomView];
    [shareView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.width.offset(width);
    }];
    self.shareLable.text = @"80%";
    UIView *balanceView = [self createViewWithHintTitle:@"可用余额" labTag:1002 isSpaceLine:true superView:bottomView];
    [balanceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(shareView.mas_right);
        make.width.offset(width);
    }];
    self.balanceLabel.text = @"¥50.00";
    UIView *freezeView = [self createViewWithHintTitle:@"冻结金额" labTag:1003 isSpaceLine:true superView:bottomView];
    [freezeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(balanceView.mas_right);
        make.width.offset(width);
    }];
    self.freezeLabel.text = @"¥10.00";
    UIView *settlementView = [self createViewWithHintTitle:@"待结算金额" labTag:1004 isSpaceLine:false superView:bottomView];
    [settlementView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(freezeView.mas_right);
        make.width.offset(width);
    }];
    self.settlementLabel.text = @"¥28.00";
    self.bottomView = bottomView;
    
}
- (UIView *)createViewWithHintTitle:(NSString *)hintTitle labTag:(NSInteger)labTag isSpaceLine:(BOOL)isSpaceLine  superView:(UIView *)superView {
    
    UIView *view = [ViewCreate createViewFrame:CGRectZero backgroundColor:kClearColor];
    [superView addSubview:view];
    UILabel *hintLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:hintTitle textColor:kWhirtColor textAlignment:kTextAlignmentCenter font:kFont_R_14];
    [view addSubview:hintLabel];
    [hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.centerX.offset(0);
        make.top.offset(10);
    }];
    UILabel *contentLable = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"" textColor:kWhirtColor textAlignment:kTextAlignmentCenter font:kFont_R_12];
    [view addSubview:contentLable];
    [contentLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.centerY.offset(5);
    }];
    if (labTag == 1001) {
        self.shareLable = contentLable;
    }else if (labTag == 1002) {
        self.balanceLabel = contentLable;
    }else if (labTag == 1003) {
        self.freezeLabel = contentLable;
    }else if (labTag == 1004) {
        self.settlementLabel = contentLable;
    }
    if (isSpaceLine) {
        UIView *lineView = [ViewCreate createViewFrame:CGRectZero backgroundColor:kWhirtColor];
        [view addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.width.offset(0.5);
            make.right.offset(0);
            make.height.offset(20);
        }];
    }
    
    return view;
}

@end
