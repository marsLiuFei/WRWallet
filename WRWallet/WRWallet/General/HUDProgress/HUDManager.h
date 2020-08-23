//
//  HUDManager.h
//  Xindai
//
//  Created by 开发 on 2019/4/22.
//  Copyright © 2019 Zeng John. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HUDManager : NSObject

#pragma mark - 全局的
/**
 加载一个全局的透明背景的加载框
 @return ProgressHUD
 */
+ (instancetype)loadingShowBg;

/**
 加载一个全局的文字框
 
 @param text 文字
 @return ProgressHUD
 */
+ (instancetype)loadingAlertWithText:(NSString *)text;

/**
 弹出一个全局的提示框
 @param text 文本
 @param imageStr 图片名称
 */
+ (void)showAlertWithText:(NSString *)text
                       image:(NSString *)imageStr;

/**
 全局显示一个文本消息 1s后消失
 @param msg 显示的文本
 */
+ (void)showMessage:(NSString *)msg;
/**
 全局显示一个文本消息 延时消失
 @param msg 显示的文本
 @param seconds 延时时间
 */
+ (void)showMessage:(NSString *)msg
                 delay:(CGFloat)seconds;
/**
 全局显示一个文本消息 延时消失
 @param msg 显示的文本
 @param seconds 延时时间
 @param completion 消失之后回调
 */
+ (void)showMessage:(NSString *)msg
                 delay:(CGFloat)seconds
            completion:(void (^)(void))completion;

#pragma mark - 自定义加载视图上
/**
 有透明背景的加载框，用于网络加载
 @param view 加载到那个视图上
 @return ProgressHUD
 */
+ (instancetype)loadingShowBgWithSuperView:(UIView *)view;

/**
 加载框
 @param view 加载到那个视图上
 @param title 加载文字
 @return ProgressHUD
 */
+ (instancetype)loadingAlertWithSuperView:(UIView *)view
                                        text:(NSString*)title;

/**
 隐藏加载框
 */
+ (void)hide;
/**
 显示加载框
 */
+ (void)show;
/**
 弹出一个纯文本的提示框
 @param view 加载到那个视图上
 @param text 文本
 */
+ (void)showAlertWithSuperView:(UIView *)view
                             Text:(NSString *)text;

/**
 弹出一个图片加文字的提示框
 @param view 加载到那个视图上
 @param text 文本
 @param imageStr 图片名称
 */
+ (void)showAlertWithSuperView:(UIView *)view
                             Text:(NSString *)text
                            image:(NSString *)imageStr;
@end

NS_ASSUME_NONNULL_END
