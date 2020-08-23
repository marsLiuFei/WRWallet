//
//  GeneralTool.m
//  Fruit
//
//  Created by ༺ོ࿆强ོ࿆ ༻ on 2020/2/2.
//  Copyright © 2020 ༺ོ࿆强ོ࿆ ༻. All rights reserved.
//

#import "GeneralTool.h"
#include <CommonCrypto/CommonDigest.h>

@implementation GeneralTool
#pragma mark -- 正则表达式判断相关
/**
 手机号码合法判断（所有的号码，排除11111111111）
 
 @param phoneStr 手机号
 @return 是否合法
 */
+(BOOL)judgePhoneIsLegalWithPhoneStr:(NSString *)phoneStr
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,184
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,177,180,189,181
     */
    
    //手机号以13,14,15,18,17开头，八个 \d 数字字符
    //    NSString *pattern = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-345-9]|7[013678])\\d{8}$";
    BOOL isMatch = NO;
    if (phoneStr.length != 11) {
        return isMatch;
    }
    if ([phoneStr isEqualToString:@"11111111111"]) {
        return isMatch;
    }
    NSString *pattern = @"^[1][0-9]{10}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    isMatch = [pred evaluateWithObject:phoneStr];
    return isMatch;
}
/**
 判断密码，只由数字和字母组成
 
 @param pwdStr 判断字符串
 @param from 从多长
 @param to 到多长
 @return   返回密码是否符合格式
 */
+ (BOOL)judgePasswordWithStr:(NSString *)pwdStr from:(int)from to:(int)to {
    
    NSString *regular = [NSString stringWithFormat:@"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{%d,%d}$" , from , to];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regular];
    return [pred evaluateWithObject:pwdStr];
}
/**
 判断名字，只由汉字和字母组成
 @param nameStr 判断字符串
 @param length  名字的长度
 @return   返回名字是否符合格式
 */
+ (BOOL)judgeNameWithStr:(NSString *)nameStr length:(int)length {
    
    NSString *regular = [NSString stringWithFormat:@"([0-9a-zA-Z\u4e00-\u9fa5]){0,%d}",length];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regular];
    return [pred evaluateWithObject:nameStr];
}
/**
 判断学校，只由汉字组成
 
 @param schoolStr 判断字符串
 @param length  学校的长度
 @return   返回名称是否符合格式
 */
+ (BOOL)judgeSchoolWithStr:(NSString *)schoolStr
                    length:(int)length {
    NSString *regular = [NSString stringWithFormat:@"([\u4e00-\u9fa5]){0,%d}",length];
     NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regular];
     return [pred evaluateWithObject:schoolStr];
}
/**
 判断年龄，只由数字组成
 
 @param ageStr 判断字符串
 @param length  名字的长度
 @return   返回名称是否符合格式
 */
+ (BOOL)judgeAgeWithStr:(NSString *)ageStr
                 length:(int)length {
    NSString *regular = [NSString stringWithFormat:@"([0-9]){0,%d}",length];
       NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regular];
       return [pred evaluateWithObject:ageStr];
}
+ (BOOL)judgeFileNameWithStr:(NSString *)fileNamStr
                         length:(int)length  {
    NSString *regular = [NSString stringWithFormat:@"([0-9a-zA-Z_\u3E00-\u9FA5]){0,%d}",length];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regular];
    return [pred evaluateWithObject:fileNamStr];
}

+ (BOOL)isValidateEmail:(NSString *)emial {
    //    NSString *emailRegex = @"^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+ \\.([a-zA-Z0-9_-]+)+$";
    NSString *emailRegex = @"^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$";
    NSPredicate *emailPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , emailRegex];
    return [emailPre evaluateWithObject: emial];
}
+ (BOOL)isCorrectFormatWithRegularExpression:(NSString *)regular withStr:(NSString *)str{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" , regular];
    return [pred evaluateWithObject:str];
}
+ (BOOL)isValidCar:(NSString *)carStr{
    NSString *regular = @"^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$";
    return [GeneralTool isCorrectFormatWithRegularExpression:regular withStr:carStr];
}


#pragma mark -- 表情符号判断
/**
 判断输入的是否为表情符号
 
 @param string 输入字符串
 @return 是否为表情
 */
+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}
#pragma mark - 特殊符号判断
+ (BOOL)isIncludeSpecialCharact: (NSString *)str {
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$€ • ´卍 ㊣ "]];
    if (urgentRange.location == NSNotFound){
        return NO;
    }
    return YES;
}
#pragma mark -- 获取当前控制器
/**
 获取当前控制器
 
 @return 当前控制器
 */
+(UIViewController *)getCurrentController{
    
    UIViewController *reController = nil;
    UIWindow *window = [[UIApplication sharedApplication]keyWindow];
    if (window.windowLevel!= UIWindowLevelNormal) {
        NSArray *array = [[UIApplication sharedApplication]windows];
        for (UIWindow *win in array) {
            if (win.windowLevel == UIWindowLevelNormal) {
                window = win;
                break;
            }
        }
    }
    UIView *cuView = [[window subviews]objectAtIndex:0];
    id responder = [cuView nextResponder];
    if ([responder isKindOfClass:[UIViewController class]]) {
        reController = responder;
    }
    else{
        reController = window.rootViewController;
    }
    return reController;
}

// 获取当前活动的navigationcontroller
+ (UINavigationController *)getNavigationViewController
{
    UIWindow *window = [[UIApplication sharedApplication]keyWindow];
    if ([window.rootViewController isKindOfClass:[UINavigationController class]]){
        return (UINavigationController *)window.rootViewController;
    }else if ([window.rootViewController isKindOfClass:[UITabBarController class]]){
        UIViewController *selectVc = [((UITabBarController *)window.rootViewController) selectedViewController];
        if ([selectVc isKindOfClass:[UINavigationController class]]){
            return (UINavigationController *)selectVc;
        }
    }
    return nil;
}


#pragma mark -- 字符串是否为空判断
+ (BOOL)isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

//根据文件名  返回Document下文件路径
+(NSString *)geZYQilePath:(NSString*)fileName
{
    //    1 找documents
    NSString *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    //    2 返回文件的路径
    return [documents stringByAppendingPathComponent:fileName];
}
+ (NSString *)sha256ForAudioFileURL:(NSURL *)audioNetworkFileURL{
    NSString *string = [audioNetworkFileURL absoluteString];
    unsigned char hash[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256([string UTF8String], (CC_LONG)[string lengthOfBytesUsingEncoding:NSUTF8StringEncoding], hash);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    for (size_t i = 0; i < CC_SHA256_DIGEST_LENGTH; ++i) {
        [result appendFormat:@"%02x", hash[i]];
    }
    return result;
}
#pragma mark -- 根据字符串获取一个高度
#pragma mark -- 根据字符串获取一个高度
//根据字符串的长度定义cell的高度
+(CGFloat)returnHeightAccordingText:(NSString *)text font:(int)font
{
   CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width, 1000);
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    style.alignment = NSTextAlignmentLeft;
    
    NSAttributedString *string = [[NSAttributedString alloc]initWithString:text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font], NSParagraphStyleAttributeName:style}];
    CGFloat height = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;
    return height;
}

+(CGFloat)returnHeightAccordingText:(NSString *)text
                                  font:(UIFont*)font
                                  width:(CGFloat)width{
    if (isEmptyStr(text)) {
        
        return 10;
    }
    CGSize size = CGSizeMake(width, 1000);
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    style.alignment = NSTextAlignmentLeft;
    
    NSAttributedString *string = [[NSAttributedString alloc]initWithString:text attributes:@{NSFontAttributeName:font, NSParagraphStyleAttributeName:style}];
    CGFloat height = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading context:nil].size.height +1;
    return height;
}

+(CGFloat)returnWidthAccordingText:(NSString *)text font:(UIFont *)font height:(CGFloat)height{
    CGSize size = CGSizeMake(1000, height);
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    style.alignment = NSTextAlignmentLeft;
    
    NSAttributedString *string = [[NSAttributedString alloc]initWithString:text attributes:@{NSFontAttributeName:font, NSParagraphStyleAttributeName:style}];
    CGFloat width = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading context:nil].size.width;
    
    return width +1;
}

#pragma mark -- 根据声音时长，获取声音时长字符串
+ (NSString *)getSoundTime:(int)second {
    int allMinute = second/60;
    NSString *allmS;
    if (allMinute<10) {
        allmS = [NSString stringWithFormat:@"0%d",allMinute];
    }else{
        allmS = [NSString stringWithFormat:@"%d",allMinute];
    }
    int allSecond = second % 60;
    NSString *allsecondStr;
    if (allSecond<10) {
        allsecondStr = [NSString stringWithFormat:@"0%d",allSecond];
    }else{
        allsecondStr = [NSString stringWithFormat:@"%d",allSecond];
    }
    return  [NSString stringWithFormat:@"%@:%@",allmS,allsecondStr];
}
#pragma mark - 两个字符串拼接富文
+ (NSMutableAttributedString *)setAtttibuteStringFirst:(NSString *)stringFirst
                                             firsZYQont:(UIFont *)firsZYQont
                                        firstTextColor:(UIColor *)firstTextColor
                                          StringSecond:(NSString *)stringSecond
                                            secondFont:(UIFont *)secondFont
                                       secondTextColor:(UIColor *)secondTextColor{
    NSMutableAttributedString *attSrtName = [[NSMutableAttributedString alloc]initWithString:stringFirst];
    [attSrtName addAttribute:NSForegroundColorAttributeName value:firstTextColor range:NSMakeRange(0,[stringFirst length])];
    [attSrtName addAttribute:NSFontAttributeName value:firsZYQont range:NSMakeRange(0, [stringFirst length])];
    NSMutableAttributedString *attSoundNum = [[NSMutableAttributedString alloc]initWithString:stringSecond];
    [attSoundNum addAttribute:NSForegroundColorAttributeName value:secondTextColor range:NSMakeRange(0,[stringSecond length])];
    [attSoundNum addAttribute:NSFontAttributeName value:secondFont range:NSMakeRange(0, [stringSecond length])];
    [attSrtName appendAttributedString:attSoundNum];
    return attSrtName;
}


#pragma mark - 传入文件大小转换成对应的 KB 或者MB

+ (NSString *)fileSizeToString:(unsigned long long)fileSize {
    NSString * fileSizeStr = nil;
    if (fileSize > 1024 * 1024) {
        fileSizeStr =   [NSString stringWithFormat:@"%@G" , [self takeOutZeroWithStr:[NSString stringWithFormat:@"%.1lf" , (double) (fileSize / 1024.00 /1024.00)]]];
    }else if (fileSize  > 1024) {
        fileSizeStr =  [NSString stringWithFormat:@"%@M" , [self takeOutZeroWithStr:[NSString stringWithFormat:@"%.1lf" , (double) (fileSize / 1024.00)]]];
    }else {
        fileSizeStr =  [NSString stringWithFormat:@"%@K" , [self takeOutZeroWithStr:[NSString stringWithFormat:@"%.1lf" , (double)fileSize]]];
    }
    
    return fileSizeStr ;
}
+ (NSString *)getFileSize:(unsigned long long)size {
    NSString *sizeText = nil;
    if (size >= 1024 * 1024*1024) { // size >= 1GB
        sizeText =  [NSString stringWithFormat:@"%@G" , [self takeOutZeroWithStr:[NSString stringWithFormat:@"%.1lf" , size / (1024.0 * 1024.0*1024.0)]]];
    } else if (size >= 1024 * 1024) { // 1GB > size >= 1MB
        sizeText =  [NSString stringWithFormat:@"%@M" , [self takeOutZeroWithStr:[NSString stringWithFormat:@"%.1lf" , size /(1024.0 *1024.0)]]];
    } else if (size >= 1024) { // 1MB > size >= 1KB
        sizeText =  [NSString stringWithFormat:@"%@K" , [self takeOutZeroWithStr:[NSString stringWithFormat:@"%.1lf" , size / 1024.0]]];
    } else { // 1KB > size
        sizeText = [NSString stringWithFormat:@"%lluB", size];
    }
    
    
    //    if (size >= pow(10, 9)) { // size >= 1GB
    //       sizeText =  [NSString stringWithFormat:@"%@G" , [self takeOutZeroWithStr:[NSString stringWithFormat:@"%.1lf" , size / pow(10, 9)]]];
    //    } else if (size >= pow(10, 6)) { // 1GB > size >= 1MB
    //         sizeText =  [NSString stringWithFormat:@"%@M" , [self takeOutZeroWithStr:[NSString stringWithFormat:@"%.1lf" , size / pow(10, 6)]]];
    //    } else if (size >= pow(10, 3)) { // 1MB > size >= 1KB
    //         sizeText =  [NSString stringWithFormat:@"%@K" , [self takeOutZeroWithStr:[NSString stringWithFormat:@"%.1lf" , size / pow(10,  3)]]];
    //    } else { // 1KB > size
    //        sizeText = [NSString stringWithFormat:@"%zdB", size];
    //    }
    return sizeText;
}
+ (NSString *)takeOutZeroWithStr:(NSString *)zeroStr{
    if ([zeroStr rangeOfString:@".0"].location !=NSNotFound) {
        zeroStr = [zeroStr substringToIndex:[zeroStr length]-2];
    }
    return zeroStr;
}
#pragma mark - 获取字符串首字母
+ (NSString *)getFirstWithStr:(NSString *)str{
    NSMutableString *ms = [[NSMutableString alloc]initWithString:str];
    if ([[str substringToIndex:1] compare:@"长"] ==NSOrderedSame){
        [ms replaceCharactersInRange:NSMakeRange(0, 1)withString:@"chang"];
    }
    if ([[str substringToIndex:1] compare:@"嗯"] ==NSOrderedSame){
        [ms replaceCharactersInRange:NSMakeRange(0, 1)withString:@"en"];
    }
    if ([[str substringToIndex:1] compare:@"沈"] ==NSOrderedSame){
        [ms replaceCharactersInRange:NSMakeRange(0, 1)withString:@"shen"];
    }
    if ([[str substringToIndex:1] compare:@"厦"] ==NSOrderedSame){
        [ms replaceCharactersInRange:NSMakeRange(0, 1)withString:@"xia"];
    }
    if ([[str substringToIndex:1] compare:@"地"] ==NSOrderedSame){
        [ms replaceCharactersInRange:NSMakeRange(0, 1)withString:@"di"];
    }
    if ([[str substringToIndex:1] compare:@"重"] == NSOrderedSame)  {
        [ms replaceCharactersInRange:NSMakeRange(0, 1) withString:@"chong"];
    }
    //    带声仄 //不能注释掉
    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0,kCFStringTransformMandarinLatin, NO)) {
    }
    NSString *cha;
    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0,kCFStringTransformStripDiacritics, NO)) {
        
        NSString *bigStr = [ms uppercaseString]; // bigStr 是转换成功后的拼音
        cha = [bigStr substringToIndex:1];
        
    }
    return cha;
}

#pragma mark - json转换成字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString{
    if ([self isBlankString:jsonString]) return nil;
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
//字典转JSON
+(NSString *)convertJSONWithDic:(NSDictionary *)dic {
    NSError *err;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dic
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:&err];
    if (err) {
        return @"字典转JSON出错";
    }
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonString;
//    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
//    NSRange range = {0,jsonString.length};
//    //去掉字符串中的空格
//    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
//    NSRange range2 = {0,mutStr.length};
//    //去掉字符串中的换行符
//    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
//
//    return mutStr;
}



#pragma  mark - 拨打电话
+ (void)callPhone:(NSString *)phone {
    NSString *telStr = [NSString stringWithFormat:@"tel:%@" , phone];
    UIWebView *callWebView = [[UIWebView alloc] init];
    [callWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:telStr]]];
    [[UIApplication sharedApplication].keyWindow addSubview:callWebView];
   
}
+ (BOOL)judgeStringIsZero:(NSString *)inputStr{
    
    NSString *str = [inputStr copy];
    NSArray *arr = [inputStr componentsSeparatedByString:@"."];
    if (arr.count == 2 ){//含有小数
        while ([str hasSuffix:@"0"]) {
            str = [str substringToIndex:[str length]-1];
        }
        if ([str hasSuffix:@"."]) {
            str = [str substringToIndex:[str length]-1];
        }
        while ([str hasSuffix:@"0"]) {
            str = [str substringToIndex:[str length]-1];
        }
    }else if (arr.count == 1){//不含小数
        while ([str hasSuffix:@"0"]) {
            str = [str substringToIndex:[str length]-1];
        }
    }
    if ([str isEqualToString:@"0"] || str.length == 0) return YES;
    return NO;
    
}

@end
