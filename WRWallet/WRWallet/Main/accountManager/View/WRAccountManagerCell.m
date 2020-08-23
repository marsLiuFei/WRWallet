//
//  WRAccountManagerCell.m
//  wallet
//
//  Created by xc-ios on 2020/8/7.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRAccountManagerCell.h"

@implementation WRAccountManagerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    UIImageView *rightImageView = [ViewCreate createImageViewFrame:CGRectZero image:@"Resources.bundle/right_icon.png"];
    [self.contentView addSubview:rightImageView];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.centerY.offset(0);
        make.width.offset(7);
        make.height.offset(13);
    }];
    UILabel *titleLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"电子账户管理" textColor:KColor_33 textAlignment:kTextAlignmentLeft font:kFont_R_16];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.equalTo(rightImageView.mas_left).offset(-10);
        make.centerY.offset(0);
    }];
}

@end
