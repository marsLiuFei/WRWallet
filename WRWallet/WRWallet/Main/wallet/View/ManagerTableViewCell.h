//
//  ManagerTableViewCell.h
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WalletSectionModel.h"
#import "WalletRowModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ManagerTableViewCell : UITableViewCell

/** 数据 */
@property(nonatomic , strong)WalletSectionModel *sectionModel;

/** 点击回调 */
@property(nonatomic , strong)void(^managerBlock)(WalletRowModel *rowModel);



@end

NS_ASSUME_NONNULL_END
