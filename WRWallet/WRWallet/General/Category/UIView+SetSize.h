//
//  UIView+SetSize.h
//  Fruit
//
//  Created by ༺ོ࿆强ོ࿆ ༻ on 2020/2/2.
//  Copyright © 2020 ༺ོ࿆强ོ࿆ ༻. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SetSize)

/**设置原点 */
@property (nonatomic , assign)CGPoint viewOrign;
/**设置尺寸 */
@property (nonatomic , assign)CGSize viewSize;

/**设置 x */
@property (nonatomic , assign)CGFloat viewX;
/**设置 y */
@property (nonatomic , assign)CGFloat viewY;
/**设置 width */
@property (nonatomic , assign)CGFloat viewWidth;
/**设置 height */
@property (nonatomic , assign)CGFloat viewHeight;

/**设置centerX */
@property (nonatomic , assign)CGFloat viewCenterX;
/**设置centerY */
@property (nonatomic , assign)CGFloat viewCenterY;
/**设置右侧 */
@property (nonatomic , assign)CGFloat viewRight;
/**设置底侧 */
@property (nonatomic , assign)CGFloat viewBottom;

/** 截屏 */
- (UIImage *)capturedImage;
@end

NS_ASSUME_NONNULL_END
