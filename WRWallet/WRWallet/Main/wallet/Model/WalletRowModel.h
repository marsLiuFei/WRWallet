//
//  WalletRowModel.h
//  wallet
//
//  Created by xc-ios on 2020/7/27.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WalletRowModel : NSObject

/** 图标 */
@property(nonatomic , strong)NSString *icon;
/** 背景图 */
@property(nonatomic , strong)NSString *bgIcon;
/** 标题 */
@property(nonatomic , strong)NSString *title;
/** 内容 */
@property(nonatomic , strong)NSString *content;
/** tag */
@property(nonatomic , assign)NSInteger rowTag;

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title content:(NSString *)content rowTag:(NSInteger)rowTag;

@end

NS_ASSUME_NONNULL_END
