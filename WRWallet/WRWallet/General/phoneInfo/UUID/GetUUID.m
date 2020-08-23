//
//  GetUUID.m
//  Xindai
//
//  Created by 开发 on 2019/6/4.
//  Copyright © 2019 Zeng John. All rights reserved.
//

#import "GetUUID.h"
#import "SSKeychain.h"

#define  kKey_Service @"com.guoguo.guwen"
#define  kKey_Account @"getUUID"

@implementation GetUUID
/** 获取UUID */
+ (NSString *)getUUID {
    
   NSString * strUUID = [SSKeychain passwordForService:kKey_Service account:kKey_Account];
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID)
    {
        //生成一个uuid的方法
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        CFStringRef uuidStr =  CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
        strUUID = [NSString stringWithFormat:@"%@",uuidStr];
        //将该uuid保存到keychain
        [SSKeychain setPassword:strUUID forService:kKey_Service account:kKey_Account];
        CFRelease(uuidRef);
        CFBridgingRelease(uuidStr);
        
    }
    return  strUUID;
}


@end
