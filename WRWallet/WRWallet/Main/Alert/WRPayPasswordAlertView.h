//
//  WRPayPasswordAlertView.h
//  wallet
//
//  Created by xc-ios on 2020/8/4.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WRPayPasswordAlertView : UIView

/** 充值输入回调 */
@property(nonatomic , strong)void(^finsihInputPassBlock)(NSString *passStr);
/** 忘记密码回调 */
@property(nonatomic , strong)void(^forgetPassBlock)();


- (void)createPayPasswordAlertView;
@end

NS_ASSUME_NONNULL_END
