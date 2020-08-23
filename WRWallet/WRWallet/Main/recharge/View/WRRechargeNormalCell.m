//
//  WRRechargeNormalCell.m
//  wallet
//
//  Created by xc-ios on 2020/8/4.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRRechargeNormalCell.h"

@interface WRRechargeNormalCell ()
/** 详情内容 */
@property(nonatomic , strong)UILabel *contentLabel;
/** 标题 */ 
@property(nonatomic , strong)UILabel *titleLabel;


@end

@implementation WRRechargeNormalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    UILabel *titleLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"充值方式" textColor:KColor_66 textAlignment:kTextAlignmentLeft font:kFont_R_14];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.bottom.offset(0);
    }];
    self.titleLabel = titleLabel;
    UILabel *contentLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"中国建设银行卡\n(6315)" textColor:KColor_66 textAlignment:kTextAlignmentRight font:kFont_R_14];
    contentLabel.numberOfLines = 2;
    [self.contentView addSubview:contentLabel];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.top.bottom.offset(0);
    }];
    self.contentLabel = contentLabel;
    
    UIView *lineView = [ViewCreate createViewFrame:CGRectZero backgroundColor:kLineColor];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.offset(-15);
        make.bottom.offset(0);
        make.height.offset(1);
    }];
    
}
@end
