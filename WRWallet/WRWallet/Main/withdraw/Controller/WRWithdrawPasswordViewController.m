//
//  WRWithdrawPasswordViewController.m
//  wallet
//
//  Created by xc-ios on 2020/8/4.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "WRWithdrawPasswordViewController.h"
#import "WRRechargeSuccessView.h"

@interface WRWithdrawPasswordViewController ()

@end

@implementation WRWithdrawPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
#pragma mark - 设置UI
- (void)setupUI {
    self.navigationItem.title = @"验证密码";
    UILabel *titleLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"验证密码" textColor:kColor_33 textAlignment:kTextAlignmentCenter font:kFont_21];
    [self.view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.centerY.equalTo(self.view.mas_centerY).multipliedBy(0.25);
    }];
    UILabel *hintLabel = [ViewCreate createLabelFrame:CGRectZero backgroundColor:kClearColor text:@"请输入支付密码，以验证身份" textColor:kColor_33 textAlignment:kTextAlignmentCenter font:kFont_R_14];
    [self.view addSubview:hintLabel];
    [hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.right.offset(-15);
        make.top.equalTo(titleLabel.mas_bottom).offset(15);
    }];
    CRBoxInputView *inputView = [self generateBoxInputView_placeholder];
    [self.view addSubview:inputView];
    [inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(300);
       make.top.equalTo(hintLabel.mas_bottom).offset(20);
        make.centerX.offset(0);
        make.height.offset(40);
   }];
//   __weak __typeof(self)weakSelf = self;
    if (!inputView.textDidChangeblock) {
        inputView.textDidChangeblock = ^(NSString *text, BOOL isFinished) {
//            __strong __typeof(weakSelf)strongSelf = weakSelf;
            WALog(@"text = %@" , text);
            if (isFinished && [text isEqualToString:@"123456"]) {
                [self gotoSuccessView];
            }else if (isFinished) {
                [self alertErrView];
            }
        };
    }
}
- (CRBoxInputView *)generateBoxInputView_placeholder{
    
    CRBoxInputCellProperty *cellProperty = [CRBoxInputCellProperty new];
    cellProperty.cellPlaceholderTextColor = KColor_99;
    cellProperty.cellPlaceholderFont = kFont_R_16;
    cellProperty.cellCursorWidth = 2;
    cellProperty.cellCursorHeight = 20;
    cellProperty.cornerRadius = 4;
    cellProperty.borderWidth = 1;
    cellProperty.cellFont = kFont_R_16;
    cellProperty.cellTextColor = KColor_33;
    
    CRBoxInputView *boxInputView = [[CRBoxInputView alloc] initWithCodeLength:6];
    boxInputView.mainCollectionView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
    boxInputView.ifNeedCursor = true;
    boxInputView.ifNeedSecurity = true;
    boxInputView.securityDelay = 0.0;
    boxInputView.keyBoardType =  UIKeyboardTypeNumberPad;
    boxInputView.inputType = CRInputType_Number;
    boxInputView.boxFlowLayout.itemSize = CGSizeMake(35, 35);
    boxInputView.placeholderText = @"";
    boxInputView.customCellProperty = cellProperty;
    [boxInputView loadAndPrepareViewWithBeginEdit:true];
    return boxInputView;
}
#pragma mark - 事件
- (void)alertErrView {
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"" message:@"密码错误，请重试" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"忘记密码" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"重试" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVc addAction:cancleAction];
    [alertVc addAction:resetAction];
    [self presentViewController:alertVc animated:true completion:nil];
}
- (void)gotoSuccessView {
     WRRechargeSuccessView *successView = [[WRRechargeSuccessView alloc] initWithFrame:self.view.bounds];
     successView.backgroundColor = kWhirtColor;
     successView.backBlock = ^{
         for (UIViewController *vc in self.navigationController.viewControllers) {
             if ([vc isKindOfClass:NSClassFromString(@"WalletViewController")]) {
                 [self.navigationController popToViewController:vc animated:true];
                 return;
             }
         }
     };
     [self.view addSubview:successView];
}


@end
