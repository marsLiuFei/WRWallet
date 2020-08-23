//
//  OpenProtocolViewController.m
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "OpenProtocolViewController.h"
#import "WROpenSuccessViewController.h"

@interface OpenProtocolViewController ()<WKUIDelegate,WKNavigationDelegate>
/**
 *加载html内容
 **/
@property(nonatomic,copy)NSString * htmlString;
/**
 *加载url网页
 **/
@property(nonatomic, strong)NSString *url;
/** 是否是本地文件 */
@property(nonatomic , assign)BOOL isLoaction;
@property(nonatomic,strong)WKWebView * singWebView;
@property(nonatomic,strong)CALayer * progresslayer;
@end

@implementation OpenProtocolViewController

- (CALayer *)progresslayer
{
    if (!_progresslayer) {
        UIView *progress = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 3)];
        [self.view addSubview:progress];
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, 0, 3);
        layer.backgroundColor = kThemeColor.CGColor;
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
        
        NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width,inital-scale=1.0,maximum-scale=1.0, minimum-scale=0.5,user-scalable=yes'); document.getElementsByTagName('head')[0].appendChild(meta);document.getElementsByTagName('body')[0].style.background='#ffffff';document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#333333';document.getElementsByTagName('body')[0].style.fontFamily='PingFang SC';";
        WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        WKUserContentController *wkUController = [[WKUserContentController alloc] init];
        [wkUController addUserScript:wkUScript];
        
        config.userContentController = wkUController;
        _singWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - kSafeAreaTopHeight - 100) configuration:config];
        _singWebView.UIDelegate = self;
        _singWebView.navigationDelegate = self;
        _singWebView.scrollView.showsVerticalScrollIndicator = false;
        _singWebView.scrollView.showsHorizontalScrollIndicator = false;
        _singWebView.opaque = false;
        _singWebView.backgroundColor = kBgColor;
        //WKWebView有一个属性estimatedProgress，就是当前网页加载的进度，所以首先监听这个属性
        [_singWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    return _singWebView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

#pragma mark - 设置UI
- (void)setupUI {
    self.navigationItem.title = @"开通协议";
    [self setupBottom];
    [self setupWebView];
}
- (void)setupBottom {
    UIView *bottomView = [ViewCreate createViewFrame:CGRectMake(0, 0, 0, 0) backgroundColor:kWhirtColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.offset(100);
    }];
    UIButton *openBtn = [ViewCreate createButtonFrame:CGRectZero title:@"同意并开通" titleColor:kWhirtColor font:kFont_16 backgroundColor:kThemeColor];
    [bottomView addSubview:openBtn];
    [openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-40);
        make.left.offset(22);
        make.right.offset(-22);
        make.height.offset(40);
    }];
    openBtn.clipsToBounds = true;
    openBtn.layer.cornerRadius = 20;
    [openBtn addTarget:self action:@selector(agreeAndOpenBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)setupWebView {
    [self.view addSubview:self.singWebView];
    [self.singWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.offset(0);
        make.bottom.offset(-100);
    }];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"ServiceProtocol.docx" ofType:nil];
    NSURL *requestUrl = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];
    [self.singWebView loadRequest:request];
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

}

#pragma mark - 事件
- (void)agreeAndOpenBtnClick {
    
    WROpenSuccessViewController *successVc = [[WROpenSuccessViewController alloc] init];
    [self.navigationController pushViewController:successVc  animated:true];
    
}

@end
