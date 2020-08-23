//
//  WalletSectionModel.h
//  wallet
//
//  Created by xc-ios on 2020/7/27.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger , WalletSectionType) {
    WalletSectionNormalType,//默认类型
    WalletSectionFinanceType,//金融服务
    WalletSectionManagerType,//钱包管理服务
    WalletSectionOteherType,//其他服务
    
    
};
@interface WalletSectionModel : NSObject
/** 标题 */
@property(nonatomic , strong)NSString *title;
/** 内容 */
@property(nonatomic , strong)NSString *content;
/** 类型 */
@property(nonatomic , assign)WalletSectionType sectionType;
/** 内容 */
@property(nonatomic , strong)NSArray *rowDatas;


+ (NSArray *)loadWalletDatas:(BOOL)isHaveWallet;


@end

NS_ASSUME_NONNULL_END
