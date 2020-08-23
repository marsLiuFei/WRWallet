//
//  DeviceDataLibrery.h
//  Xindai
//
//  Created by 开发 on 2019/6/4.
//  Copyright © 2019 Zeng John. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeviceDataLibrery : NSObject
/** 获取设备名称 */
+ ( NSString *)getDiviceName;
/** 获取设备初始系统型号 */
+ ( NSString *)getInitialVersion;
/** 获取设备电池容量，单位 mA 毫安 */
+ (NSInteger)getBatteryCapacity;
/** 获取电池电压，单位 V 福特 */
+ (CGFloat)getBatterVolocity;
/** 获取CPU处理器名称 */
+ ( NSString *)getCPUProcessor;

@end

NS_ASSUME_NONNULL_END
