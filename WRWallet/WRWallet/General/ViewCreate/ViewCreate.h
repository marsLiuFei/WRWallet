//
//  ViewCreate.h
//  Xindai
//
//  Created by 开发 on 2019/4/3.
//  Copyright © 2019 Zeng John. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewCreate : UIView
#pragma  mark -  创建视图
+ (UIView *)createViewFrame:(CGRect)frame
            backgroundColor:(UIColor *)backgroundColor;
#pragma  mark -  创建直线
+ (UIView *)createLineFrame:(CGRect)frame
            backgroundColor:(UIColor *)backgroundColor;
#pragma  mark -  创建label
+ (UILabel *)createLabelFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
                         text:(NSString *)text
                    textColor:(UIColor *)textColor
                textAlignment:(NSTextAlignment)textAlignment
                         font:(UIFont *)font;
#pragma mark - 创建Button
+ (UIButton *)createButtonFrame:(CGRect)frame
                          title:(NSString *)title
                     titleColor:(UIColor *)titleColor
                           font:(UIFont *)font
                backgroundColor:(UIColor *)backgroundColor;
#pragma mark - 创建背景图片按钮
+ (UIButton *)createButtonFrame:(CGRect)frame
          normalBackgroundImage:(NSString *)normalBackgroundImage
        selectedBackgroundImage:(NSString *)selectedBackgroundImage;
#pragma mark - 创建图片按钮
+ (UIButton *)createButtonFrame:(CGRect)frame
          normalImage:(NSString *)normalImage
        selectedImage:(NSString *)selectedImage;

#pragma mark - 设置按钮的边线颜色和线宽
+ (void)setButtonLayer:(UIButton *)button
           borderColor:(UIColor *)borderColor
           borderWidth:(CGFloat )borderWidth;
#pragma mark - 创建图片视图
+ (UIImageView *)createImageViewFrame:(CGRect)frame
                                image:(NSString *)image;
#pragma mark - 创建UITextField
+ (UITextField *)createTextFieldFrame:(CGRect)frame
                                 font:(UIFont *)font
                            textColor:(UIColor *)textColor
                          placeHolder:(NSString *)placeHolder
                             delegate:(id<UITextFieldDelegate>)delegate;
@end

NS_ASSUME_NONNULL_END
