//
//  NSDate+GeneralDate.h
//  Fruit
//
//  Created by ༺ོ࿆强ོ࿆ ༻ on 2020/2/2.
//  Copyright © 2020 ༺ོ࿆强ོ࿆ ༻. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (GeneralDate)

/*
 //时间的格式说明
 G: 公元时代，例如AD公元
 yy: 年的后2位
 yyyy: 完整年
 MM: 月，显示为1-12
 MMM: 月，显示为英文月份简写,如 Jan
 MMMM: 月，显示为英文月份全称，如 Janualy
 dd: 日，2位数表示，如02
 d: 日，1-2位显示，如 2
 EEE: 简写星期几，如Sun
 EEEE: 全写星期几，如Sunday
 aa: 上下午，AM/PM
 H: 时，24小时制，0-23
 K：时，12小时制，0-11
 m: 分，1-2位
 mm: 分，2位
 s: 秒，1-2位
 ss: 秒，2位
 S: 毫秒
 Z：GMT
 */
#pragma mark -- 单例
/**
 创建单例NSDateFormatter

 @return dateFormatter
 */
+ (NSDateFormatter *)sharedDateFormatter;

/**
 创建NSCalendar单例

 @return NSCalendar
 */
+ (NSCalendar *)sharedCalendar;

#pragma mark -- 获取日、月、年、小时、分钟、秒
/**
 * huod
 */
- (NSUInteger)day;
- (NSUInteger)month;
- (NSUInteger)year;
- (NSUInteger)hour;
- (NSUInteger)minute;
- (NSUInteger)second;
+ (NSUInteger)day:(NSDate *)date;
+ (NSUInteger)month:(NSDate *)date;
+ (NSUInteger)year:(NSDate *)date;
+ (NSUInteger)hour:(NSDate *)date;
+ (NSUInteger)minute:(NSDate *)date;
+ (NSUInteger)second:(NSDate *)date;
#pragma mark -- 判断闰月年
/**
 * 判断是否是润年
   @return YES表示润年，NO表示平年
 */
- (BOOL)isLeapYear;
+ (BOOL)isLeapYear:(NSDate *)date;
#pragma mark -- 一年中有多少天，距离当前日期几天前
/**
 距离日期几天前
    @return 几天
 */
- (NSUInteger)daysAgo;
+ (NSUInteger)daysAgo:(NSDate *)date;
/**
 一年中有多少天
    @return 天数
 */
- (NSUInteger)daysInYear;
+ (NSUInteger)daysInYear:(NSDate *)date;


#pragma mark -- 判断有几周
/**
 判断该日期是该年的第几周
 @return 第几周
 */
- (NSUInteger)weekForYear;
+ (NSUInteger)weekForYear:(NSDate *)date;

/**
  判断该月有几周(可能会有4、5、6)，存在一天就算一周
 @return 周数
 */
- (NSUInteger)weekForMonth;
+ (NSUInteger)weekFotMonth:(NSDate *)date;

#pragma mark -- 获取该月的第一天和最后一天日期
/**
 获取当月第一天的日期
 @return 开始日期
 */
- (NSDate *)begindayOfMonth;
+ (NSDate *)begindayOfMonth:(NSDate *)date;
/**
 获取当月最后一天的日期
 @return 结束日期
 */
- (NSDate *)lastdayOfMonth;
+ (NSDate *)lastdayOfMonth:(NSDate *)date;
#pragma mark -- 多长时间后的日期
/**
 返回day天后的日期(若day为负数,则为|day|天前的日期)
 @param day 天数
 @return 日期
 */
- (NSDate *)dateAfterDay:(NSInteger)day;
+ (NSDate *)dateAfterDate:(NSDate *)date
                         day:(NSInteger)day;

/**
 返回month月后的日期(若month为负数,则为|month|月前的日期)
 @param month 月
 @return 日期
 */
- (NSDate *)dateAfterMonth:(NSInteger)month;
+ (NSDate *)dateAfterDate:(NSDate *)date
                       month:(NSInteger)month;

/**
 返回year年后的日期(若year为负数,则为|year|年前的日期)
 @param year 年
 @return 日期
 */
- (NSDate *)dateAfterYear:(NSInteger)year;
+ (NSDate *)dateAfterDate:(NSDate *)date
                        year:(NSInteger)year;

/**
 返回hour小时后的日期(若hour为负数,则为|hour|小时前的日期)
 @param hour 小时
 @return 日期
 */
- (NSDate *)dateAfterHour:(NSInteger)hour;
+ (NSDate *)dateAfterDate:(NSDate *)date
                        hour:(NSInteger)hour;

#pragma mark -- 时间格式的字符串
/**
    获得yyy-MM-dd / HH:mm:ss / yyyy-MM-dd HH:mm:ss 字符串
 */
- (NSString *)ymdFormat;
- (NSString *)hmsFormatIs24hour:(BOOL)is24hour;
- (NSString *)ymd_hmsFormatIs24hour:(BOOL)is24hour;
+ (NSString *)ymdFormat;
+ (NSString *)hmsFormatIs24hour:(BOOL)is24hour;
+ (NSString *)ymd_hmsFormatIs24hour:(BOOL)is24hour;

/**
 当前对应格式的时间

 @param format 时间格式 yyyy-MM-dd HH:mm:ss 类型的字符串
 @return 最新时间字符串
 */
+ (NSString *)getNewTimeFormat:(NSString *)format;

/**
 时间戳

 @return 时间戳字符串 精确到秒
 */
+ (NSString *)getTimeStamps;

/**
 获得对应时间格式的字符串

 @param format 字符串格式
 @param date 时间
 @return 对应时间
 */
+ (NSString *)getNewTimeFormat:(NSString *)format
                             date:(NSDate *)date;

#pragma mark -- 判断时间早晚
/**
 判断时间的先后

 @param oneday 第一个时间点
 @param anotherDay 第二个时间点
 @param isIncludeSecond 是否精确到秒
 @return 时间的早晚（1----第二个时间点大于第一个  -1----第二个时间点小于第一个    0----第二个时间点等于第一个  ）
 */
+ (int)compareDate:(NSDate *)oneday
   withAnotherDate:(NSDate *)anotherDay
withIsIncludeSecond:(BOOL)isIncludeSecond;

/**
 判断日期是否相等
 @param anotherDate 另外一个日期
 @return 是否相等
 */
- (BOOL)isSameDay:(NSDate *)anotherDate;

/**
  判断日期是否相等

 @param oneDate 一个日期
 @param anotherDate 另外一个日期
 @return 是否相等
 */
+ (BOOL)isSameDay:(NSDate *)oneDate
             another:(NSDate *)anotherDate;
/**
 是否是今天
 @return 是不是今天
 */
- (BOOL)isToday;
/**
  是否是今天
 @param today 传入时间
 @return 是不是今天
 */
+ (BOOL)isTodayWithDate:(NSDate *)today;
#pragma mark -- 返回时间格式字符串
/**
 返回时间字符串（今天,明天 或者几月几号）
 @param date 传入的时间
 @return 字符串
 */
+ (NSString *)timeWithDate:(NSDate *)date;

/**
 指定差值的字符串
 @param delay 时间差值(小时)
 @return 日期字符串 “yyyy-MM-dd HH:mm:ss”
 */
+ (NSString *)dateStringWithDelay:(NSTimeInterval)delay;
// 返回日期格式字符串
///
/// 具体格式如下：
///     - 刚刚(一分钟内)
///     - X分钟前(一小时内)
///     - X小时前(当天)
///     - X天前
///     - X月前
///     - X年前
///     - MM-dd HH:mm(一年内)
///     - yyyy-MM-dd HH:mm(更早期)
@property (nonatomic, readonly) NSString *dateDescription;

#pragma mark -- 星期相关

/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSUInteger)weekDay;
+ (NSUInteger)weekDay:(NSDate *)date;
/**
 *  获取星期几(名称)
 *ju
 *  @return Return weekday as a localized string
 *  [1 - 星期日 Sunday]
 *  [2 - 星期一 Monday]
 *  [3 - 星期二 Tuerday]
 *  [4 - 星期三 Wednesday]
 *  [5 - 星期四 Thursday]
 *  [6 - 星期五 Friday]
 *  [7 - 星期六 Saturday]
 */
- (NSString *)dayFromWeekdayIsEnglish:(BOOL)isEnglish;
+ (NSString *)dayFromWeekday:(NSDate *)date isEnglish:(BOOL)isEnglish;

#pragma mark -- 其他
/**
 英文格式的时间

 @param dateStr 时间字符串
 @param format 格式 @"MM/dd/yyyy hh:mm:ss aa"
 @return NSDate
 */
+ (NSDate *)dateWithLocalEN_USString:(NSString *)dateStr format:(NSString *)format;

/**
 获得对应时间格式的NSDate

 @param dateStr 时间字符串
 @param format 格式
 @return NSDate
 */
+ (NSDate *)dateWithString:(NSString *)dateStr format:(NSString *)format;


#pragma mark -- 获得当前本地时间

/**
 获得本地时间
 @return 返回本地实时间
 */
+ (NSDate *)getCurrentDate;

/**
 获得时间对应的本地时间
 @param date 传入的时间
 @return 本地时间
 */
+ (NSDate *)getLocationDate:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
