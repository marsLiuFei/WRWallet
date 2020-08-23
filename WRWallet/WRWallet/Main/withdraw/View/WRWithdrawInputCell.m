//
//  WRWithdrawInputCell.m
//  wallet
//
//  Created by xc-ios on 2020/8/4.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRWithdrawInputCell.h"

@interface WRWithdrawInputCell ()<UITextFieldDelegate>
/** 输入文字 */
@property(nonatomic , strong)UITextField * inputField;

@end


@implementation WRWithdrawInputCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
#pragma mark - 设置UI
- (void)setupUI {
   UILabel *titleLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"提现金额" textColor:KColor_66 textAlignment:kTextAlignmentLeft font:kFont_R_14];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(10);
    }];
    UILabel *hintLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"￥" textColor:KColor_33 textAlignment:kTextAlignmentLeft font:kRegularFont(24)];
    [self.contentView addSubview:hintLabel];
    [hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel.mas_left);
        make.top.equalTo(titleLabel.mas_bottom).offset(15);
    }];
    UITextField * inputField = [ViewCreate createTextFieldFrame:CGRectZero font:kMediumFont(24) textColor:KColor_33 placeHolder:@"请输入金额" delegate:self];
    [self.contentView addSubview:inputField];
    [inputField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.centerY.equalTo(hintLabel.mas_centerY);
        make.left.equalTo(hintLabel.mas_right).offset(15);
    }];
    inputField.keyboardType = UIKeyboardTypeNumberPad;
    UIView *lineView = [ViewCreate createViewFrame:CGRectZero backgroundColor:kLineColor];
      [self.contentView addSubview:lineView];
      [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.offset(15);
          make.right.offset(-15);
          make.top.equalTo(hintLabel.mas_bottom).offset(10);
          make.height.offset(1);
      }];
    UILabel *moneryHintLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"可提现金额￥1000" textColor:KColor_66 textAlignment:kTextAlignmentLeft font:kFont_R_14];
    [self.contentView addSubview:moneryHintLabel];
    [moneryHintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.bottom.offset(-2);
    }];
    UIButton *withdrawBtn = [ViewCreate createButtonFrame:CGRectZero title:@"全部提现" titleColor:[UIColor getColor:@"#F24141"] font:kFont_R_14 backgroundColor:kClearColor];
    [self.contentView addSubview:withdrawBtn];
    [withdrawBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.centerY.equalTo(moneryHintLabel.mas_centerY);
    }];
    [withdrawBtn addTarget:self action:@selector(withdrawBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)withdrawBtnClick {
    
}

@end
