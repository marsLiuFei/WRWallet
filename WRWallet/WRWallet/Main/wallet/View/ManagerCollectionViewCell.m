//
//  ManagerCollectionViewCell.m
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "ManagerCollectionViewCell.h"


@interface ManagerCollectionViewCell ()
/** 图标 */
@property(nonatomic , strong)UIImageView *iconImageView;
/** 标题 */
@property(nonatomic , strong)UILabel *titleLabel;


@end

@implementation ManagerCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    UIImageView *iconImageView = [ViewCreate createImageViewFrame:CGRectZero image:@"Resources.bundle/card_icon.png"];
    [self.contentView addSubview:iconImageView];
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.centerY.offset(-10);
        make.width.height.offset(32);
    }];
    self.iconImageView = iconImageView;
    UILabel *titleLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"银行卡管理" textColor:KColor_33 textAlignment:kTextAlignmentCenter font:kFont_R_13];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconImageView.mas_bottom).offset(5);
        make.left.right.offset(0);
    }];
    self.titleLabel = titleLabel;
    
}
- (void)setRowModel:(WalletRowModel *)rowModel {
    _rowModel = rowModel;
    self.iconImageView.image = [UIImage imageNamed:rowModel.icon];
    self.titleLabel.text = rowModel.title;
}

@end
