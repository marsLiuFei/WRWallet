//
//  BaseViewController.m
//  Fruit
//
//  Created by ༺ོ࿆强ོ࿆ ༻ on 2020/2/2.
//  Copyright © 2020 ༺ོ࿆强ོ࿆ ༻. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavNormal];
    [self setupStatusBgClolor];
   
}
- (void)setNavNormal{
    self.navigationController.navigationBar.translucent = false;
    //导航栏背景颜色
    [self.navigationController.navigationBar setBarTintColor:kThemeColor];
    //导航黑线问题
    self.navigationController.navigationBar.clipsToBounds = true;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:kWhirtColor , NSFontAttributeName:kRegularFont(18)};
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = kBgColor;
     [self setNeedsStatusBarAppearanceUpdate];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

}
- (void)setupStatusBgClolor {
    if (@available(iOS 13.0, *)) {
       UIView *statusBar = [[UIView alloc]initWithFrame:[UIApplication sharedApplication].keyWindow.windowScene.statusBarManager.statusBarFrame] ;
        statusBar.backgroundColor = kThemeColor;
        [[UIApplication sharedApplication].keyWindow addSubview:statusBar];
    } else {
        // Fallback on earlier versions
        UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
           if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
               statusBar.backgroundColor = kThemeColor;
           }
    }
}
- (void)setupBackIcon {
    UIImage *backButtonImage = [[UIImage imageNamed:@"back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 0)];//15为图片宽度＋间距
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}
//设置状态栏字体颜色
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;//白色
}

@end
