//
//  WRWalletManager.m
//  WRWallet
//
//  Created by 如沐春风 on 2020/8/19.
//  Copyright © 2020 mars. All rights reserved.
//

#import "WRWalletManager.h"
#import "WalletViewController.h"

@interface WRWalletManager()

@end

@implementation WRWalletManager
+ (void )openWalletMinePageWithUid:(NSString *)userid  currentNavi:(UINavigationController *)currentNavi{
    WalletViewController *vc = [WalletViewController new];
    vc.uid = userid;
    [currentNavi pushViewController:vc animated:YES];
}
@end
