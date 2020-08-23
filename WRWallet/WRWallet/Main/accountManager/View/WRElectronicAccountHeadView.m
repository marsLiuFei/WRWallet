//
//  WRElectronicAccountHeadView.m
//  wallet
//
//  Created by xc-ios on 2020/8/7.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRElectronicAccountHeadView.h"

@implementation WRElectronicAccountHeadView


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {;
    self.contentView.backgroundColor = kWhirtColor;
    UIView *lineView = [ViewCreate createViewFrame:CGRectZero backgroundColor:kThemeColor];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.centerY.offset(0);
        make.width.offset(3);
        make.height.offset(12);
    }];
    UILabel *titleLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"个人服务" textColor:KColor_33 textAlignment:kTextAlignmentLeft font:kFont_16];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(5);
        make.centerY.offset(0);
    }];
    
}


@end
