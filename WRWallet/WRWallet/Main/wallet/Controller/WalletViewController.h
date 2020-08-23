//
//  WalletViewController.h
//  wallet
//
//  Created by xc-ios on 2020/7/27.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WalletViewController : BaseViewController
/** 是否开通钱包 */
@property(nonatomic , assign)BOOL isHaveWallet;
/**
 *用户id
 **/
@property(nonatomic, copy)NSString *uid;
@end

NS_ASSUME_NONNULL_END
