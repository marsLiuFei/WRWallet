//
//  ManagerCollectionViewCell.h
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WalletRowModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManagerCollectionViewCell : UICollectionViewCell
/** 数据 */
@property(nonatomic , strong)WalletRowModel *rowModel;

@end

NS_ASSUME_NONNULL_END
