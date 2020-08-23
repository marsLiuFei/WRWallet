//
//  UIView+SetSize.m
//  Fruit
//
//  Created by ༺ོ࿆强ོ࿆ ༻ on 2020/2/2.
//  Copyright © 2020 ༺ོ࿆强ོ࿆ ༻. All rights reserved.
//

#import "UIView+SetSize.h"

@implementation UIView (SetSize)

#pragma mark -- setupFrame
- (void)setViewOrign:(CGPoint)viewOrign {
    CGRect newFrame     = self.frame;
    newFrame.origin     = viewOrign;
    self.frame          = newFrame;
}
- (CGPoint)viewOrign {
    return self.frame.origin;
}
- (void)setViewSize:(CGSize)viewSize {
    CGRect newFrame     = self.frame;
    newFrame.size       = viewSize;
    self.frame          = newFrame;
}
- (CGSize)viewSize {
    return self.frame.size;
}

#pragma mark --setupPoint
- (void)setViewX:(CGFloat)viewX {
    CGRect newFrame     = self.frame;
    newFrame.origin.x   = viewX;
    self.frame          = newFrame;
}
- (CGFloat)viewX {
    return self.frame.origin.x;
}
- (void)setViewY:(CGFloat)viewY {
    CGRect newFrame     = self.frame;
    newFrame.origin.y   = viewY;
    self.frame          = newFrame;
}
- (CGFloat)viewY {
    return self.frame.origin.y;
}
- (void)setViewWidth:(CGFloat)viewWidth {
    CGRect newFrame     = self.frame;
    newFrame.size.width = viewWidth;
    self.frame          = newFrame;
}
- (CGFloat)viewWidth{
    return self.frame.size.width;
}
- (void)setViewHeight:(CGFloat)viewHeight {
    CGRect newFrame     = self.frame;
    newFrame.size.height = viewHeight;
    self.frame          = newFrame;
}
- (CGFloat)viewHeight {
    return self.frame.size.height;
}
- (void)setViewCenterX:(CGFloat)viewCenterX {
   
    CGPoint center = self.center;
    center.x = viewCenterX;
    self.center = center;
}
- (CGFloat)viewCenterX {
    return self.center.x;
}
- (void)setViewCenterY:(CGFloat)viewCenterY {
    CGPoint center = self.center;
    center.y = viewCenterY;
    self.center = center;
}
- (CGFloat)viewCenterY {
    return self.center.y;
}

#pragma mark -- setupbottom、right
- (void)setViewRight:(CGFloat)viewRight {
    self.viewX = viewRight - self.viewWidth;
}

- (CGFloat)viewRight {
    return CGRectGetMaxX(self.frame);
}
- (void)setViewBottom:(CGFloat)viewBottom {
   
    self.viewY = viewBottom - self.viewHeight;
}
- (CGFloat)viewBottom {
    return CGRectGetMaxY(self.frame);
}


#pragma mark -- 截屏
- (UIImage *)capturedImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    UIImage *result = nil;
    if ([self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES]) {
        result = UIGraphicsGetImageFromCurrentImageContext();
    }
    
    UIGraphicsEndImageContext();
    
    return result;
}

@end
