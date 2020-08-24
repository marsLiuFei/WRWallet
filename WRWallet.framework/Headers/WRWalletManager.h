//
//  WRWalletManager.h
//  WRWallet
//
//  Created by 如沐春风 on 2020/8/19.
//  Copyright © 2020 mars. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WRWalletManager : NSObject
+ (void )openWalletMinePageWithUid:(NSString *)userid currentNavi:(UINavigationController *)currentNavi;
@end

NS_ASSUME_NONNULL_END
