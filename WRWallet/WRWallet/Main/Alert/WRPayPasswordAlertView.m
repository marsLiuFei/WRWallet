//
//  WRPayPasswordAlertView.m
//  wallet
//
//  Created by xc-ios on 2020/8/4.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRPayPasswordAlertView.h"

@implementation WRPayPasswordAlertView


- (void)createPayPasswordAlertView {
    UIView *maskView = [ViewCreate createViewFrame:self.bounds backgroundColor:kBlackColor];
    maskView.alpha = 0.5;
    [self addSubview:maskView];
    
    UIView *alertView = [ViewCreate createViewFrame:CGRectZero backgroundColor:kWhirtColor];
    [self addSubview:alertView];
    alertView.clipsToBounds = true;
    alertView.layer.cornerRadius = 5;
    [alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.offset(0);
        make.width.offset(290);
        make.height.offset(160);
    }];
    UIButton *closeBtn = [ViewCreate createButtonFrame:CGRectZero title:@"X" titleColor:KColor_33 font:kFont_R_16 backgroundColor:kClearColor];
    [alertView addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(5);
    }];
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];

    UILabel *titleLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"请输入支付密码" textColor:KColor_33 textAlignment:kTextAlignmentCenter font:kFont_15];
    [alertView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(closeBtn.mas_bottom).offset(-5);
    }];
    CRBoxInputView *inputView = [self generateBoxInputView_placeholder];
    [alertView addSubview:inputView];
    [inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.offset(0);
        make.width.offset(192);
        make.height.offset(40);
        
   }];
    if (!inputView.textDidChangeblock) {
        inputView.textDidChangeblock = ^(NSString *text, BOOL isFinished) {
            WALog(@"text = %@" , text);
            if (isFinished && self.finsihInputPassBlock) {
                [self removeFromSuperview];
                self.finsihInputPassBlock(text);
            }
        };
    }
    UIButton *forgetPasswordBtn = [ViewCreate createButtonFrame:CGRectZero title:@"找回密码并支付" titleColor:[UIColor getColor:@"#1A77EB"] font:kFont_R_13 backgroundColor:kClearColor];
    [alertView addSubview:forgetPasswordBtn];
    [forgetPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(inputView.mas_bottom).offset(5);
        make.centerX.offset(0);
    }];
    [forgetPasswordBtn addTarget:self action:@selector(forgetPasswordBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (CRBoxInputView *)generateBoxInputView_placeholder{
    CRBoxInputCellProperty *cellProperty = [CRBoxInputCellProperty new];
    cellProperty.cellPlaceholderTextColor = KColor_99;
    cellProperty.cellPlaceholderFont = kFont_R_16;
    cellProperty.cellCursorWidth = 2;
    cellProperty.cellCursorHeight = 20;
    cellProperty.cornerRadius = 1;
    cellProperty.borderWidth = 1;
    cellProperty.cellFont = kFont_R_16;
    cellProperty.cellTextColor = KColor_33;
    
    CRBoxInputView *boxInputView = [[CRBoxInputView alloc] initWithCodeLength:6];
    boxInputView.mainCollectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    boxInputView.ifNeedCursor = true;
    boxInputView.ifNeedSecurity = true;
    boxInputView.securityDelay = 0.0;
    boxInputView.keyBoardType =  UIKeyboardTypeNumberPad;
    boxInputView.inputType = CRInputType_Number;
    boxInputView.boxFlowLayout.itemSize = CGSizeMake(32, 32);
    boxInputView.boxFlowLayout.minLineSpacing = 0;
    boxInputView.placeholderText = @"";
    boxInputView.customCellProperty = cellProperty;
    [boxInputView loadAndPrepareViewWithBeginEdit:true];
    return boxInputView;
}
#pragma mark - 事件
- (void)closeBtnClick {
    [self removeFromSuperview];
}

- (void)forgetPasswordBtnClick {
    if (self.forgetPassBlock) {
        self.forgetPassBlock();
    }
}
@end
