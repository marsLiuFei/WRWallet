//
//  WRPayAlertView.h
//  wallet
//
//  Created by xc-ios on 2020/8/4.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WRPayAlertView : UIView

/** 充值回调 */
@property(nonatomic , strong)void(^paySureBlock)(void);

- (void)createPayView:(NSString *)moneryStr;

@end

NS_ASSUME_NONNULL_END
