//
//  FinancialTableViewCell.h
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FinancialTableViewCell : UITableViewCell

/** 点击事件 */
@property(nonatomic , strong)void(^financialClickBlock)(BOOL isSaveMonery);



@end

NS_ASSUME_NONNULL_END
