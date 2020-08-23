//
//  WalletBottomView.h
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WalletBottomView : UIView
/** 是否开通钱包 */
@property(nonatomic , assign)BOOL isHaveWallet;

/** 开通点击 */
@property(nonatomic , strong)void(^openClickBlock)();


@end

NS_ASSUME_NONNULL_END
