//
//  OpenSwitchTableViewCell.h
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpenInputModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OpenSwitchTableViewCell : UITableViewCell

/** 模型对象 */
@property(nonatomic , strong)OpenInputModel *inputModel;


@end

NS_ASSUME_NONNULL_END
