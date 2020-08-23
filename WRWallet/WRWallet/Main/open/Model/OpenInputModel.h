//
//  OpenInputModel.h
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,OpenInputType){
    OpenInputNormalType,
    OpenInputSwitchType,
    OpenInputPasswordType
};

@interface OpenInputModel : NSObject
/** 标题 */
@property(nonatomic , strong)NSString *title;
/** 内容 */
@property(nonatomic , strong)NSString *content;
/** 提示文字 */
@property(nonatomic , strong)NSString *placeHolder;
/** 类型 */
@property(nonatomic , assign)OpenInputType type;
/** tag */
@property(nonatomic , assign)NSInteger tag;

+ (NSArray *)loadOpenInputDatas;


@end

NS_ASSUME_NONNULL_END
