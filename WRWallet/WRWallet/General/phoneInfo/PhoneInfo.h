//
//  PhoneInfo.h
//  Xindai
//
//  Created by 开发 on 2019/6/4.
//  Copyright © 2019 Zeng John. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhoneInfo : NSObject
/** 获取设备的UUID */
+ (NSString *)getDeviceUUID;
/** 获取设备型号 */
+ (NSString *)getDeviceModel;
/** 获取设备类型 */
+ (NSString *)getDeviceType;
/** 获取app版本 */
+ (NSString *)getAppVersion;
/** 获取app build版本号 */
+ (NSString *)getAppBuildVersion;
/** 获取手机系统版本好 */
+ (NSString *)getPhoneVersion;
/** 获取设备名称 */
+ (NSString *)getPhoneName;
/** 获取手机用户的别名 */
+ (NSString *)getPhoneNickName;
/** 获取App名称 */
+ (NSString *)getAppName;
/** 获取设备上次重启的时间 */
+ (NSDate *)getSystemUptime;
/** 获取状态栏的网络状态 */
+(NSString *)getNetworkType;

/** 获取CPU数量 */
+ (NSUInteger)getCPUCount;
/** 获取CPU总的使用百分比 */
+ (float)getCPUUsage;
/** 获取单个CPU使用百分比 */
+ (NSArray *)getPerCPUUsage;


/** 获取本 App 所占磁盘空间 */
+ (NSString *)getApplicationSize;
/** 获取磁盘总空间 */
+ (int64_t)getTotalDiskSpace;
/** 获取未使用的磁盘空间 */
+ (int64_t)getFreeDiskSpace;
/** 获取已使用的磁盘空间 */
+ (int64_t)getUsedDiskSpace;

/** 获取总内存空间 */
+ (int64_t)getTotalMemory;
/** 获取活跃的内存空间 */
+ (int64_t)getActiveMemory;
/** 获取不活跃的内存空间 */
+ (int64_t)getInActiveMemory;
/** 获取空闲的内存空间 */
+ (int64_t)getFreeMemory;
/** 获取正在使用的内存空间 */
+ (int64_t)getUsedMemory;
/** 获取存放内核的内存空间 */
+ (int64_t)getWiredMemory;
/** 获取可释放的内存空间 */
+ (int64_t)getPurgableMemory;



@end

NS_ASSUME_NONNULL_END
