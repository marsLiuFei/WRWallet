//
//  HUDManager.m
//  Xindai
//
//  Created by 开发 on 2019/4/22.
//  Copyright © 2019 Zeng John. All rights reserved.
//

#import "HUDManager.h"
#import "MBProgressHUD.h"

@interface HUDManager ()
/**hub */
@property (nonatomic , strong)MBProgressHUD *hud;
@end

@implementation HUDManager

#define kHideTime 1.0f
#define kColor    [UIColor blackColor]
#define kHUDBgColor  [UIColor colorWithRed:0.4 green:0.4 blue:0.44 alpha:1]
#define kFont     [UIFont fontWithName:@"PingFang-SC-Regular" size:14]
#define kFontColor   kColor_91
+ sharedProgressHUD {
    static HUDManager *_Hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _Hud = [[HUDManager alloc] init];
    });
    
    return _Hud;
}


+ (instancetype)loadingShowBgWithSuperView:(UIView *)view {
    HUDManager *Hud   = [HUDManager sharedProgressHUD];
    MBProgressHUD *hud      = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.backgroundColor     = kHUDBgColor;
    hud.bezelView.color     = [UIColor clearColor];
    Hud.hud               = hud;
    return Hud;
}

+ (instancetype)loadingShowBg {
    HUDManager *Hud   = [HUDManager sharedProgressHUD];
    MBProgressHUD *hud      = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].delegate.window];
    [[UIApplication sharedApplication].delegate.window addSubview:hud];
    hud.backgroundColor     = kHUDBgColor;
    hud.bezelView.color   = [UIColor clearColor];
    Hud.hud               = hud;
    [hud showAnimated:YES];
    return Hud;
}
+ (instancetype)loadingAlertWithText:(NSString *)text {
    return [self loadingAlertWithSuperView:[UIApplication sharedApplication].delegate.window
                                         text:text];
}

+ (instancetype)loadingAlertWithSuperView:(UIView *)view text:(NSString*)title {
    HUDManager *Hud   = [HUDManager sharedProgressHUD];
    MBProgressHUD *hud      = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text          = title;
    hud.square              = YES;
    hud.contentColor        = kFontColor;
    hud.bezelView.color     = kHUDBgColor;
    hud.bezelView.style     = MBProgressHUDBackgroundStyleSolidColor;
    hud.label.font          = kFont;
    hud.margin              = 15;
    hud.label.numberOfLines = 0;
    Hud.hud               = hud;
    [self showShadowWithView:hud];
    return Hud;
}


+ (void)hide {
    HUDManager *Hud  = [HUDManager sharedProgressHUD];
    [Hud.hud hideAnimated:YES afterDelay:0.0f];
    [Hud.hud removeFromSuperview];
}
+ (void)show {
    HUDManager *Hud    = [HUDManager sharedProgressHUD];
    [Hud.hud showAnimated:YES];
}
+ (void)showAlertWithSuperView:(UIView *)view Text:(NSString *)text{
    MBProgressHUD *hud      = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode                = MBProgressHUDModeText;
    hud.label.text          = text;
    hud.center              = view.center;
    hud.bezelView.color     = kColor;
    hud.label.font          = kFont;
    hud.contentColor        = kFontColor;
    hud.margin              = 15;
    //    hud.yOffset         = view.frame.size.height;
    [self showShadowWithView:hud];
    [hud hideAnimated:YES afterDelay:kHideTime];
}
+ (void)showAlertWithSuperView:(UIView *)view Text:(NSString *)text image:(NSString *)imageStr {
    //设置一个小的view限定宽度
    UIView *bgView = [[UIView alloc] init];
    bgView.frame = CGRectMake(0, 0, view.frame.size.width * 0.5, view.frame.size.width * 0.5);
    bgView.center = CGPointMake(view.center.x, view.center.y);
    [self showShadowWithView:bgView];
    [view addSubview:bgView];
    MBProgressHUD *hud      = [MBProgressHUD showHUDAddedTo:bgView animated:YES];
    hud.mode                = MBProgressHUDModeCustomView;
    UIImage *image          = [[UIImage imageNamed:imageStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    hud.customView          = [[UIImageView alloc] initWithImage:image];
    hud.square              = YES;
    hud.label.text          = text;
    hud.label.numberOfLines = 0;
    hud.label.font          = kFont;
    hud.contentColor        = kFontColor;
    hud.bezelView.color     = kColor;
    hud.margin              = 15;
    [hud hideAnimated:YES afterDelay:kHideTime];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kHideTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [bgView removeFromSuperview];
    });
    
    
}
+ (void)showAlertWithText:(NSString *)text image:(NSString *)imageStr {
    [self showAlertWithSuperView:[UIApplication sharedApplication].delegate.window Text:text image:imageStr];
    
}
#pragma mark -- 全局显示一个文本
+ (void)showMessage:(NSString *)msg{
    [self showMessage:msg delay:kHideTime];
}

+ (void)showMessage:(NSString *)msg delay:(CGFloat)seconds{
    [self showMessage:msg delay:seconds completion:nil];
    
}

+ (void)showMessage:(NSString *)msg delay:(CGFloat)seconds completion:(void (^)(void))completion
{
    if ([self isEmpty:msg])
    {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        MBProgressHUD *hud      = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].delegate.window];
        [[UIApplication sharedApplication].delegate.window addSubview:hud];
        hud.mode                = MBProgressHUDModeText;
        hud.label.text          = msg;
        hud.label.font          = kFont;
        hud.label.numberOfLines = 0;
        hud.contentColor        = kFontColor;
        hud.bezelView.color     = kHUDBgColor;
        hud.bezelView.style     = MBProgressHUDBackgroundStyleSolidColor;
        hud.margin              = 15;
        [self showShadowWithView:hud];
        [hud showAnimated:YES];
        [hud hideAnimated:YES afterDelay:seconds];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud removeFromSuperview];
            if (completion)
            {
                completion();
            }
        });
        
    });
}
+ (BOOL)isEmpty:(NSString *)string
{
    return !string||[string isKindOfClass:[NSNull class]]||[string isEqualToString:@""];
}


+ (void)showShadowWithView:(UIView *)shadowView {
    shadowView.layer.shadowColor   =  [UIColor colorWithRed:77.0/255.0 green:143.0/255.0 blue:251.0/255.0 alpha:1].CGColor;
    shadowView.layer.shadowOffset  = CGSizeMake(5, 5);
    shadowView.layer.shadowOpacity = 0.19;
    shadowView.layer.shadowRadius  = 5;
}





@end
