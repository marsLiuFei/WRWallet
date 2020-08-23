//
//  BaseWebViewController.m
//  Fruit
//
//  Created by ༺ོ࿆强ོ࿆ ༻ on 2020/4/11.
//  Copyright © 2020 ༺ོ࿆强ོ࿆ ༻. All rights reserved.
//

#import "BaseWebViewController.h"

@interface BaseWebViewController ()<WKUIDelegate,WKNavigationDelegate>


@end

@implementation BaseWebViewController


- (CALayer *)progresslayer
{
    if (!_progresslayer) {
        UIView *progress = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 3)];
        [self.view addSubview:progress];
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, 0, 3);
        layer.backgroundColor = kWhirtColor.CGColor;
        [progress.layer addSublayer:layer];
        self.progresslayer = layer;
    }
    return _progresslayer;
}

- (WKWebView *)singWebView
{
    if (!_singWebView) {
        //初始化一个WKWebViewConfiguration对象
        WKWebViewConfiguration *config = [WKWebViewConfiguration new];
        //        //初始化偏好设置属性：preferences
        config.preferences = [WKPreferences new];
        //是否支持JavaScript
        config.preferences.javaScriptEnabled = YES;
        //不通过用户交互，是否可以打开窗口
        config.preferences.javaScriptCanOpenWindowsAutomatically = YES;
        
        NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width,inital-scale=0.7,maximum-scale=1.0, minimum-scale=0.2,user-scalable=yes'); document.getElementsByTagName('head')[0].appendChild(meta);document.getElementsByTagName('body')[0].style.background='#000000';document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#919191';document.getElementsByTagName('body')[0].style.fontFamily='PingFang SC';";
//            // 设置字体
//            NSString *fontFamilyStr = @"document.getElementsByTagName('body')[0].style.fontFamily='PingFang SC';";
//            [webView evaluateJavaScript:fontFamilyStr completionHandler:nil];
//            //设置颜色
//            [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#ffffff'" completionHandler:nil];
//            //修改字体大小
//            [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '100%'"completionHandler:nil];
//        //     改变网页内容背景颜色
        //    [_singWebView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.background='#000000'"completionHandler:nil];
        
        WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        WKUserContentController *wkUController = [[WKUserContentController alloc] init];
        [wkUController addUserScript:wkUScript];
        
        config.userContentController = wkUController;
        _singWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - kSafeAreaTopHeight) configuration:config];
        _singWebView.UIDelegate = self;
        _singWebView.navigationDelegate = self;
        _singWebView.opaque = false;
        _singWebView.backgroundColor = kBgColor;
        //WKWebView有一个属性estimatedProgress，就是当前网页加载的进度，所以首先监听这个属性
        [_singWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    return _singWebView;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progresslayer.opacity = 1;
        //不要让进度条倒着走...有时候goback会出现这种情况
        if ([change[@"new"] floatValue] < [change[@"old"] floatValue]) {
            return;
        }
        self.progresslayer.frame = CGRectMake(0, 0, self.view.bounds.size.width * [change[@"new"] floatValue], 3);
        if ([change[@"new"] floatValue] == 1) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progresslayer.opacity = 0;
            });
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progresslayer.frame = CGRectMake(0, 0, 0, 3);
            });
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.singWebView];
    [self.singWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = self.navTitle;
}



-(void)setUrl:(NSString *)url{
    _url = url;
    NSURL *requestUrl = [NSURL URLWithString:url];
    if (self.isLoaction) {
      requestUrl = [NSURL fileURLWithPath:url];
    }
    NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];
    [self.singWebView loadRequest:request];
}

-(void)setHtmlString:(NSString *)htmlString{
    _htmlString = htmlString;
    [self.singWebView loadHTMLString:[NSString stringWithFormat:@"<html><head><meta name='viewport' content='width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no'> <meta name='apple-mobile-web-app-capable' content='yes'><meta name='apple-mobile-web-app-status-bar-style' content='black'><style>img{width:100%%;}a{word-wrap: break-word;}</style></head><body>%@</body></html>",_htmlString] baseURL:nil];
}

/**
 清理网页缓存
 */
- (void)deleteWebCache {
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0) {
        NSSet *websiteDataTypes = [NSSet setWithArray:@[WKWebsiteDataTypeDiskCache,
                                                        //WKWebsiteDataTypeOfflineWebApplicationCache,
                                                        WKWebsiteDataTypeMemoryCache,
                                                        //WKWebsiteDataTypeLocalStorage,
                                                        //WKWebsiteDataTypeCookies,
                                                        //WKWebsiteDataTypeSessionStorage,
                                                        //WKWebsiteDataTypeIndexedDBDatabases,
                                                        //WKWebsiteDataTypeWebSQLDatabases
                                                        ]];
        //// Date from
        NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
        //// Execute
        [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
            // Done
        }];
    } else {
        NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *cookiesFolderPath = [libraryPath stringByAppendingString:@"/Cookies"];
        NSError *errors;
        [[NSFileManager defaultManager] removeItemAtPath:cookiesFolderPath error:&errors];
    }
}

- (void)dealloc{
    [self deleteWebCache];
    [(WKWebView *)self.singWebView removeObserver:self forKeyPath:@"estimatedProgress"];
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
//    [self addTapImageGesture];

}
//-(void) addTapImageGesture{
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
//    tapGesture.numberOfTapsRequired = 1;
//    tapGesture.delegate = (id)self;
//    [self.singWebView addGestureRecognizer:tapGesture];
//}
////这里增加手势的返回，不然会被WKWebView拦截
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    return YES;
//}
//-(void) tapGestureAction:(UITapGestureRecognizer *)recognizer
//{
//    //首先要获取用户点击在WKWebView 的范围点
//    CGPoint touchPoint = [recognizer locationInView:self.singWebView];
//    NSString *imgURLJS = [NSString stringWithFormat:@"document.elementFromPoint(%f, %f).src", touchPoint.x, touchPoint.y];
//    //跟着注入JS 获取 异步获取结果
//    [self.singWebView evaluateJavaScript:imgURLJS completionHandler:^(id result, NSError * _Nullable error) {
//        if (error == nil)
//        {
//            NSString *url = result;
//            if (url.length == 0){ return ;}
//            //如果是url 则转换成 UIImage
//            NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
//           GGLog(@"imageUrl = %@", url);
//            UIImage *clickImg = [UIImage imageWithData:imgData];
//            if (clickImg)
//            {
//                //                    NSArray *imgArr = @[url];
//                NSMutableArray *tempArray = [[NSMutableArray alloc] init];
//                [tempArray addObject:clickImg];
//            }
//        }
//    }];
//}

@end
