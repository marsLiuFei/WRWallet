//
//  OpenInputTableViewCell.m
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "OpenInputTableViewCell.h"

@interface OpenInputTableViewCell ()<UITextFieldDelegate>
/** 标题 */
@property(nonatomic , strong)UILabel *titleLabel;
/** 输入框 */
@property(nonatomic , strong)UITextField *inputField;

@end

@implementation OpenInputTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    UILabel *titleLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"" textColor:kColor_33 textAlignment:kTextAlignmentLeft font:kFont_R_16];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.centerY.offset(0);
        make.width.offset(100);
    }];
    self.titleLabel = titleLabel;
    UITextField *inputField = [ViewCreate createTextFieldFrame:CGRectZero font:kFont_R_13 textColor:kColor_33 placeHolder:@"" delegate:self];
    [self.contentView addSubview:inputField];
    self.inputField = inputField;
    [inputField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(titleLabel.mas_right).offset(5);
        make.right.offset(-15);
    }];
    
    UIView *lineView = [ViewCreate createViewFrame:CGRectZero backgroundColor:kLineColor];
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.offset(-15);
        make.bottom.offset(0);
        make.height.offset(0.5);
    }];
    
}
- (void)setInputModel:(OpenInputModel *)inputModel {
    _inputModel = inputModel;
    self.titleLabel.text = inputModel.title;
    self.inputField.placeholder = inputModel.placeHolder;
    if (!StringIsEmpty(inputModel.content)) {
        self.inputField.text = inputModel.content;
    }
    self.inputField.text = inputModel.content;
    self.inputField.secureTextEntry = false;
    if (inputModel.type == OpenInputPasswordType) {
        self.inputField.secureTextEntry = true;
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    UITextRange *selectRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectRange.start offset:0];
    if (!position) {
        self.inputModel.content = textField.text;
    }
    return true;
}


@end
