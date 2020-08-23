//
//  WalletBottomView.m
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WalletBottomView.h"

@interface WalletBottomView ()

/** 按钮 */
@property(nonatomic , strong)UIButton *openBtn;
/** 提醒文字 */
@property(nonatomic , strong)UILabel *hintLabel;
/** 图标 */
@property(nonatomic , strong)UIImageView *iconImageView;


@end

@implementation WalletBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        
    }
    return self;
}
- (void)setupUI {
    UIButton *openBtn = [ViewCreate createButtonFrame:CGRectZero title:@"去开通" titleColor:kWhirtColor font:kFont_16 backgroundColor:kThemeColor];
    [self addSubview:openBtn];
    [openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-40);
        make.left.offset(22);
        make.right.offset(-22);
        make.height.offset(40);
    }];
    openBtn.clipsToBounds = true;
    openBtn.layer.cornerRadius = 20;
    [openBtn addTarget:self action:@selector(openBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.openBtn = openBtn;
    
    UILabel *hintLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"您尚未开通钱包" textColor:KColor_70 textAlignment:kTextAlignmentCenter font:kFont_16];
    [self addSubview:hintLabel];
    [hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.equalTo(openBtn.mas_top).offset(-30);
    }];
    self.hintLabel = hintLabel;
    UIImageView *iconImageView = [ViewCreate createImageViewFrame:CGRectZero image:@"Resources.bundle/logo_des.png"];
    [self addSubview:iconImageView];
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.offset(-kSafeAreaHeight - 10);
    }];
    self.iconImageView = iconImageView;
    
    
}
- (void)setIsHaveWallet:(BOOL)isHaveWallet {
    _isHaveWallet = isHaveWallet;
    self.hintLabel.hidden = isHaveWallet;
    self.openBtn.hidden = isHaveWallet;
    self.iconImageView.hidden = !isHaveWallet;
}


- (void)openBtnClick {
    if (self.openClickBlock) {
        self.openClickBlock();
    }
    
}

@end
