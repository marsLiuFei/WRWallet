//
//  WalletHeaderView.m
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WalletHeaderView.h"

@interface WalletHeaderView ()
/** 内容 */
@property(nonatomic , strong)UILabel *contentLabel;
/** 标题 */
@property(nonatomic , strong)UILabel *titleLabel;


@end

@implementation WalletHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headSelectedClick)];
    [self.contentView addGestureRecognizer:tapG];
    self.contentView.backgroundColor = kWhirtColor;
    UIView *lineView = [ViewCreate createViewFrame:CGRectZero backgroundColor:kThemeColor];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.centerY.offset(0);
        make.width.offset(3);
        make.height.offset(12);
    }];
    UILabel *titleLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"" textColor:KColor_33 textAlignment:kTextAlignmentLeft font:kFont_R_16];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(5);
        make.centerY.offset(0);
    }];
    self.titleLabel = titleLabel;
    UIImageView *rightImageView = [ViewCreate createImageViewFrame:CGRectZero image:@"Resources.bundle/right_icon.png"];
    [self.contentView addSubview:rightImageView];
    [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.centerY.offset(0);
        make.width.offset(7);
        make.height.offset(13);
    }];
    UILabel *contentLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"" textColor:KColor_70 textAlignment:kTextAlignmentRight font:kFont_R_14];
    [self.contentView addSubview:contentLabel];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(rightImageView.mas_left).offset(-10);
        make.centerY.offset(0);
    }];
    self.contentLabel = contentLabel;
    
}
-(void)setSectionModel:(WalletSectionModel *)sectionModel {
    _sectionModel = sectionModel;
    self.titleLabel.text = sectionModel.title;
    self.contentLabel.text = sectionModel.content;
}
- (void)headSelectedClick {
    
    if (self.walletHeaderBlock) {
        self.walletHeaderBlock(self.sectionModel);
    }
}



@end
