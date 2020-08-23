//
//  OpenSwitchTableViewCell.m
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "OpenSwitchTableViewCell.h"

@interface OpenSwitchTableViewCell ()
/** 标题 */
@property(nonatomic , strong)UILabel *titleLabel;
/** 开关 */
@property(nonatomic , strong)UISwitch *switchBtn;


@end

@implementation OpenSwitchTableViewCell

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
    }];
    self.titleLabel = titleLabel;
    
    UISwitch *switchBtn = [[UISwitch alloc] init];
    [self.contentView addSubview:switchBtn];
    self.switchBtn = switchBtn;
    [switchBtn addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.centerY.offset(0);
    }];
    switchBtn.transform = CGAffineTransformMakeScale(0.75, 0.75);
    
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
    if ([inputModel.content isEqualToString:@"1"]) {
        self.switchBtn.on = true;
        return;
    }

    self.switchBtn.on = false;
    
}

- (void)valueChanged:(UISwitch *)switchClick {
    self.inputModel.content = switchClick.isOn ?@"1":@"0";
    
}

@end
