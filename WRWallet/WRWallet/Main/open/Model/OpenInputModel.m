//
//  OpenInputModel.m
//  wallet
//
//  Created by xc-ios on 2020/7/28.
//  Copyright © 2020 为仁科技. All rights reserved.
//

#import "OpenInputModel.h"

@implementation OpenInputModel

+(NSArray *)loadOpenInputDatas {
    
    OpenInputModel *nameModel = [[OpenInputModel alloc] initWithTitle:@"姓名" placeHolder:@"请输入你的真实姓名" type:OpenInputNormalType tag:1001];
    OpenInputModel *numberModel = [[OpenInputModel alloc] initWithTitle:@"身份证号" placeHolder:@"请输入你的身份证号码" type:OpenInputNormalType tag:1002];
    OpenInputModel *phoneModel = [[OpenInputModel alloc] initWithTitle:@"手机号码" placeHolder:@"请输入你的手机号码" type:OpenInputNormalType tag:1003];
    OpenInputModel *bankNumberModel = [[OpenInputModel alloc] initWithTitle:@"银行卡号" placeHolder:@"请输入你的银行借记卡号" type:OpenInputNormalType tag:1004];
    
    
    OpenInputModel *passwordModel = [[OpenInputModel alloc] initWithTitle:@"设置交易密码" placeHolder:@"请输入6位数字密码" type:OpenInputPasswordType tag:1005];
    OpenInputModel *surePasswordModel = [[OpenInputModel alloc] initWithTitle:@"确认密码" placeHolder:@"请再次输入密码" type:OpenInputPasswordType tag:1006];
    
    OpenInputModel *accountModel = [[OpenInputModel alloc] initWithTitle:@"是否同意开通电子账户" placeHolder:@"" type:OpenInputSwitchType tag:1007];
    return @[@[nameModel,numberModel,phoneModel,bankNumberModel],@[passwordModel,surePasswordModel],@[accountModel]];
}
- (instancetype)initWithTitle:(NSString *)title
                  placeHolder:(NSString *)placeHolder
                         type:(OpenInputType)type
                          tag:(NSInteger)tag {
    if (self = [super init]) {
        self.title = title;
        self.placeHolder = placeHolder;
        self.type = type;
        self.tag = tag;
    }
    return self;
}

@end
