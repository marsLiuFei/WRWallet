//
//  BaseWebViewController.h
//  Fruit
//
//  Created by ༺ོ࿆强ོ࿆ ༻ on 2020/4/11.
//  Copyright © 2020 ༺ོ࿆强ོ࿆ ༻. All rights reserved.
//

#import "BaseViewController.h"
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseWebViewController : BaseViewController
/**
 *加载html内容
 **/
@property(nonatomic,copy)NSString * htmlString;
/**
 *加载url网页
 **/
@property(nonatomic, strong)NSString *url;
/** navTitle */
@property (nonatomic,strong) NSString *navTitle;
/** 是否是本地文件 */
@property(nonatomic , assign)BOOL isLoaction;
@property(nonatomic,strong)WKWebView * singWebView;
@property(nonatomic,strong)CALayer * progresslayer;
@end

NS_ASSUME_NONNULL_END
