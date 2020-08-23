//
//  WalletHeaderView.h
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WalletSectionModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WalletHeaderView : UITableViewHeaderFooterView
/** 模型对象 */
@property(nonatomic , strong)WalletSectionModel *sectionModel;

/** 头部视图点击回调 */
@property(nonatomic , strong)void(^walletHeaderBlock)(WalletSectionModel *sectionModel);



@end

NS_ASSUME_NONNULL_END
