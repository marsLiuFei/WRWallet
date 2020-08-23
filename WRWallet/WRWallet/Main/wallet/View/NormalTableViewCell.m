//
//  NormalTableViewCell.m
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "NormalTableViewCell.h"

@interface NormalTableViewCell ()
/** 图标 */
@property(nonatomic , strong)UIImageView *iconImageView;
/** 标题 */
@property(nonatomic , strong)UILabel *titleLabel;

@end

@implementation NormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    UIImageView *iconImageView = [ViewCreate createImageViewFrame:CGRectZero image:@"Resources.bundle/recharge_icon.png"];
    [self.contentView addSubview:iconImageView];
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.left.offset(15);
        make.width.height.offset(24);
    }];
    self.iconImageView = iconImageView;
    UIImageView *rightImageView = [ViewCreate createImageViewFrame:CGRectZero image:@"Resources.bundle/right_icon.png"];
    [self.contentView addSubview:rightImageView];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.centerY.offset(0);
        make.width.offset(7);
        make.height.offset(13);
    }];
    UIView *lineView = [ViewCreate createViewFrame:CGRectZero backgroundColor:kLineColor];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.offset(-15);
        make.bottom.offset(0);
        make.height.offset(1);
    }];
    UILabel *titleLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"" textColor:KColor_33 textAlignment:kTextAlignmentLeft font:kFont_R_16];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconImageView.mas_right).offset(10);
        make.right.equalTo(rightImageView.mas_left).offset(-10);
        make.centerY.offset(0);
    }];
    self.titleLabel = titleLabel;
}
- (void)setRowModel:(WalletRowModel *)rowModel {
    _rowModel = rowModel;
    self.titleLabel.text = rowModel.title;
    self.iconImageView.image = [UIImage imageNamed:rowModel.icon];
}
@end
