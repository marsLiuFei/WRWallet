//
//  NSDate+GeneralDate.m
//  Fruit
//
//  Created by ༺ོ࿆强ོ࿆ ༻ on 2020/2/2.
//  Copyright © 2020 ༺ོ࿆强ོ࿆ ༻. All rights reserved.
//

#import "NSDate+GeneralDate.h"

@implementation NSDate (GeneralDate)

+ (NSDateFormatter *)sharedDateFormatter {
    static NSDateFormatter *dateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"locale"];
    });
    return dateFormatter;
}

+ (NSCalendar *)sharedCalendar {
    static NSCalendar *calendar;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        calendar = [NSCalendar currentCalendar];
    });
    return calendar;
}

#pragma mark -- 获取日、月、年、小时、分钟、秒
//天
- (NSUInteger)day {
    return [NSDate day:self];
}
+(NSUInteger)day:(NSDate *)date {
    NSCalendar *calendar = [NSDate sharedCalendar];
   
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSDayCalendarUnit) fromDate:date];
#endif
    return [dayComponents day];
}

//月
- (NSUInteger)month {
    return [NSDate month:self];
}
+ (NSUInteger)month:(NSDate *)date {
    NSCalendar *calendar = [NSDate sharedCalendar];
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:date];
#else
    NSDateComponents *dayComponents =[calendar components:(NSMonthCalendarUnit) fromDate:date];
#endif
    return [dayComponents month];
}

//年
- (NSUInteger)year {
    return [NSDate year:self];
}
+ (NSUInteger)year:(NSDate *)date {
    NSCalendar *calendar = [NSDate sharedCalendar];
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit) fromDate:date];;
#endif
    return [dayComponents year];
}

//时
- (NSUInteger)hour {
    return [NSDate hour:self];
}
+ (NSUInteger)hour:(NSDate *)date {
    NSCalendar *calendar = [NSDate sharedCalendar];
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitHour) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSHourCalendarUnit) fromDate:date];;
#endif
    return [dayComponents hour];
}
//分
- (NSUInteger)minute {
    return [NSDate minute:self];
}
+ (NSUInteger)minute:(NSDate *)date {
    NSCalendar *calendar = [NSDate sharedCalendar];
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMinuteCalendarUnit) fromDate:date];;
#endif
    return [dayComponents minute];
}
//秒
- (NSUInteger)second {
    return [NSDate second:self];
}
+ (NSUInteger)second:(NSDate *)date {
    NSCalendar *calendar = [NSDate sharedCalendar];
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSSecondCalendarUnit) fromDate:date];;
#endif
    return [dayComponents second];
}
#pragma mark -- 判断闰月年
- (BOOL)isLeapYear {
    return [NSDate isLeapYear:self];
}
+ (BOOL)isLeapYear:(NSDate *)date {
    NSInteger year = [date year];
    if ( (year % 4 == 0 && year % 100 != 0)||(year % 400 == 0)) {
        return YES;
    }
    return NO;
}
#pragma mark -- 一年中有多少天，距离当前日期几天前

- (NSUInteger)daysAgo {
    return [NSDate daysAgo:self];
}
+ (NSUInteger)daysAgo:(NSDate *)date {
    NSCalendar *calendar = [NSDate sharedCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
#else
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
#endif
    
    return [components day];

}

- (NSUInteger)daysInYear {
    return [NSDate daysInYear:self];
}
+ (NSUInteger)daysInYear:(NSDate *)date {
    return [NSDate isLeapYear:date]?366:365;
}

#pragma mark -- 判断有几周
- (NSUInteger)weekForYear {
    return [NSDate weekForYear:self];
}
+ (NSUInteger)weekForYear:(NSDate *)date {
    NSUInteger i;
    NSUInteger year = [date year];//2017
    for (i = 1;[[date dateAfterDay:-7 * i] year] == year; i++) {
    }
    return i-1;
}
- (NSUInteger)weekForMonth {
    return [NSDate weekFotMonth:self];
}
+ (NSUInteger)weekFotMonth:(NSDate *)date {
    return [[date lastdayOfMonth] weekForYear] -[[date begindayOfMonth] weekForYear] + 1;
}

#pragma mark -- 获取该月的第一天和最后一天日期
- (NSDate *)begindayOfMonth {
    return [NSDate begindayOfMonth:self];
}
+ (NSDate *)begindayOfMonth:(NSDate *)date {
    return [self dateAfterDate:date day:-[date day] +1];
}
- (NSDate *)lastdayOfMonth {
    return [NSDate lastdayOfMonth:self];
}
+ (NSDate *)lastdayOfMonth:(NSDate *)date {
    NSDate *lastDate = [self begindayOfMonth:date];
    return [[NSDate dateAfterDate:lastDate month:1] dateAfterDay:-1];
}

#pragma mark -- 多长时间后的日期
//天
- (NSDate *)dateAfterDay:(NSInteger)day {
    return [NSDate dateAfterDate:self
                                day:day];
}
+ (NSDate *)dateAfterDate:(NSDate *)date
                         day:(NSInteger)day {
    if (date == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    NSDateComponents *compomentsAdd = [[NSDateComponents alloc] init];
    [compomentsAdd setDay:day];
    NSDate *afterDate = [calendar dateByAddingComponents:compomentsAdd
                                                  toDate:date
                                                 options:0];
    return afterDate;
}
//月
- (NSDate *)dateAfterMonth:(NSInteger)month {
    
    return [NSDate dateAfterDate:self month:month];
}

+ (NSDate *)dateAfterDate:(NSDate *)date month:(NSInteger)month {
    if (date == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *calendar = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *calendar = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    NSDateComponents *compomentsAdd = [[NSDateComponents alloc] init];
    [compomentsAdd setMonth:month];
    NSDate *afterDate = [calendar dateByAddingComponents:compomentsAdd
                                                  toDate:date
                                                 options:0];
    return afterDate;
}
//年
- (NSDate *)dateAfterYear:(NSInteger)year {
    return [NSDate dateAfterDate:self year:year];
}
+ (NSDate *)dateAfterDate:(NSDate *)date year:(NSInteger)year {
    if (date == nil) {
        return nil;
    }
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    NSDateComponents *compomentsAdd = [[NSDateComponents alloc] init];
    [compomentsAdd setYear:year];
    NSDate *afterDate = [calendar dateByAddingComponents:compomentsAdd
                                                  toDate:date
                                                 options:0];
    return afterDate;
}
//时
- (NSDate *)dateAfterHour:(NSInteger)hour {
    
    return [NSDate dateAfterDate:self hour:hour];
}
+ (NSDate *)dateAfterDate:(NSDate *)date hour:(NSInteger)hour {
    if (date == nil) {
        return nil;
    }
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    //NSDayCalendarUnit
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    NSDateComponents *compomentsAdd = [[NSDateComponents alloc] init];
    [compomentsAdd setHour:hour];
    NSDate *afterDate = [calendar dateByAddingComponents:compomentsAdd
                                                  toDate:date
                                                 options:0];
    return afterDate;
}
#pragma mark -- 时间格式的字符串
+ (NSString *)getNewTimeFormat:(NSString *)format {
    NSDateFormatter *formatter  = [[NSDateFormatter alloc] init];
    formatter.dateFormat        = format;
    NSDate *date                = [NSDate date];
    return [formatter stringFromDate:date];
}
- (NSString *)ymdFormat {
    return [NSDate ymdFormat];
}
- (NSString *)hmsFormatIs24hour:(BOOL)is24hour {
    return [NSDate hmsFormatIs24hour:is24hour];
}
- (NSString *)ymd_hmsFormatIs24hour:(BOOL)is24hour {
    return [NSDate ymd_hmsFormatIs24hour:is24hour];
}
+ (NSString *)ymdFormat {
   return @"yyy-MM-dd";
}
+ (NSString *)hmsFormatIs24hour:(BOOL)is24hour {
    if (is24hour) {
      return @"HH:mm:ss";
    }
  return @"hh:mm:ss";
}
+ (NSString *)ymd_hmsFormatIs24hour:(BOOL)is24hour {
    if (is24hour) {
        return @"yyyy-MM-dd HH:mm:ss";
    }
   return @"yyyy-MM-dd hh:mm:ss";
}
+ (NSString *)getTimeStamps {
    NSDate *date                    = [NSDate date];
    NSDateFormatter *dateFormatter  = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat        = @"yyyyMMddHHmmss";
    return [dateFormatter stringFromDate:date];
}
+ (NSString *)getNewTimeFormat:(NSString *)format
                             date:(NSDate *)date{
    NSDateFormatter *formatter      = [[NSDateFormatter alloc] init];
    formatter.dateFormat            = format;
    return [formatter stringFromDate:date];
}


#pragma mark -- 判断时间早晚
+ (int)compareDate:(NSDate *)oneday
   withAnotherDate:(NSDate *)anotherDay
withIsIncludeSecond:(BOOL)isIncludeSecond {
   
    NSDateFormatter *dateFormatter = [NSDate sharedDateFormatter];
    NSString *oneDayStr;
    NSString *anotherDayStr;
    if (isIncludeSecond) {
        oneDayStr       = [NSDate getNewTimeFormat:[NSDate ymd_hmsFormatIs24hour:YES] date:oneday];
        anotherDayStr   = [NSDate getNewTimeFormat:[NSDate ymd_hmsFormatIs24hour:YES] date:anotherDay];
        [dateFormatter setDateFormat:[NSDate ymd_hmsFormatIs24hour:YES]];
    }else {
        oneDayStr       = [NSDate getNewTimeFormat:@"yyyy-MM-dd HH:mm" date:oneday];
        anotherDayStr   = [NSDate getNewTimeFormat:@"yyyy-MM-dd HH:mm" date:anotherDay];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    }
  
    NSDate *Adate       = [dateFormatter dateFromString:oneDayStr];
    NSDate *Bdate       = [dateFormatter dateFromString:anotherDayStr];
    NSAssert(Adate != nil || Bdate != nil, @"有的时间传入为空,转换不正确");
    NSComparisonResult result = [Bdate compare:Adate];
    if (result == NSOrderedDescending) {
        return  1;
    }else if (result == NSOrderedAscending) {
        return  -1;
    }else {
        return 0;
    }
}

- (BOOL)isSameDay:(NSDate *)anotherDate {
    return [NSDate isSameDay:self another:anotherDate];
}
+ (BOOL)isSameDay:(NSDate *)oneDate
             another:(NSDate *)anotherDate {
    NSCalendar *calender                = [NSDate sharedCalendar];
    NSDateComponents *oneComponents     = [calender components:NSCalendarUnitYear
                                                             | NSCalendarUnitMonth
                                                             | NSCalendarUnitDay
                                                  fromDate:oneDate];
    NSDateComponents *anotherComponents = [calender components:NSCalendarUnitYear
                                                             | NSCalendarUnitMonth
                                                             | NSCalendarUnitDay
                                                      fromDate:anotherDate];
    return (oneComponents.year == anotherComponents.year &&
            oneComponents.month == anotherComponents.month&&
            oneComponents.day == anotherComponents.day);
}

- (BOOL)isToday {
    return [NSDate isTodayWithDate:self];
}
+ (BOOL)isTodayWithDate:(NSDate *)today {
    return [NSDate isSameDay:[NSDate date] another:today];
}
#pragma mark -- 返回时间时间格式字符串
+ (NSString *)timeWithDate:(NSDate *)date {
    NSString *currentDateStr            = [NSDate getNewTimeFormat:@"MM-dd"];
    NSDate *tomorrowDate                = [NSDate dateAfterDate:[NSDate date] day:1];
    NSDateFormatter *dateFormatter      = [NSDate sharedDateFormatter];
    [dateFormatter setDateFormat:@"MM-dd"];
    NSString *tomorrowDateStr           = [dateFormatter stringFromDate:tomorrowDate];
    NSString *nowStr                    = [dateFormatter stringFromDate:date];
    if ([currentDateStr isEqualToString:nowStr]) {
        return @"今天";
    }else if ([tomorrowDateStr isEqualToString:nowStr]) {
        return @"明天";
    }else {
        return nowStr;
    }
}
+ (NSString *)dateStringWithDelay:(NSTimeInterval)delay {
    [self sharedDateFormatter].dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:delay*60*60];
    
    return [[self sharedDateFormatter] stringFromDate:date];
}
- (NSString *)dateDescription {
    NSUInteger units = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *dateComponents    = [[NSDate sharedCalendar] components:units fromDate:self];
    NSDateComponents *thisComponents    = [[NSDate sharedCalendar] components:units fromDate:[NSDate date]];
    if (dateComponents.year == thisComponents.year && dateComponents.month == thisComponents.month && dateComponents.day == thisComponents.day) {
        NSInteger  delay = (NSInteger)[[NSDate date] timeIntervalSinceDate:self];
        
        if (delay < 60) {
            return @"刚刚";
        }else if (delay < 3600) {
            return [NSString stringWithFormat:@"%ld 分钟前" , delay / 60];
        }
        return [NSString stringWithFormat:@"%ld 小时前" , delay / 3600];
    }else if (dateComponents.year == thisComponents.year && dateComponents.month == thisComponents.month && dateComponents.day != thisComponents.day) {
        if (thisComponents.day > dateComponents.day) {
            return [NSString stringWithFormat:@"%ld 天前" , thisComponents.day - dateComponents.day];
        }
    }else if (dateComponents.year == thisComponents.year && dateComponents.month != thisComponents.month ) {
        if (thisComponents.month > dateComponents.month) {
            return [NSString stringWithFormat:@"%ld 月前" , thisComponents.month - dateComponents.month];
        }
    }else if (dateComponents.year == thisComponents.year) {
        if (thisComponents.year > dateComponents.year) {
            return [NSString stringWithFormat:@"%ld 年前" , thisComponents.year - dateComponents.year];
        }
    }
    NSString *format = @"MM-dd HH:mm";
    if (dateComponents.year != thisComponents.year) {
        format = [@"yyyy-" stringByAppendingString:format];
    }
    [NSDate sharedDateFormatter].dateFormat = format;
    return [[NSDate sharedDateFormatter] stringFromDate:self];
}
#pragma mark -- 星期相关
- (NSUInteger)weekDay {
    return [NSDate weekDay:self];
}
+ (NSUInteger)weekDay:(NSDate *)date {
    NSCalendar *calendar = [NSDate sharedCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay
                                                         |NSCalendarUnitMonth
                                                         | NSCalendarUnitYear
                                                         | NSCalendarUnitWeekday)
                                               fromDate:date];
    return [components weekday];
}
- (NSString *)dayFromWeekdayIsEnglish:(BOOL)isEnglish {
    return [NSDate dayFromWeekday:self isEnglish:isEnglish];
}
+ (NSString *)dayFromWeekday:(NSDate *)date isEnglish:(BOOL)isEnglish {
    switch ([date weekDay]) {
        case 1:
            
            return isEnglish?@"Sunday":@"星期天";
            break;
        case 2:
            return isEnglish?@"Monday":@"星期一";
            break;
        case 3:
            return isEnglish?@"Tuerday":@"星期二";
            break;
        case 4:
            return isEnglish?@"Wednesday":@"星期三";
            break;
        case 5:
            return isEnglish?@"Thursday":@"星期四";
            break;
        case 6:
            return isEnglish?@"Friday":@"星期五";
            break;
        case 7:
            return isEnglish?@"Saturday":@"星期六";
            break;
        default:
            break;
    }
    return @"";
}
#pragma mark -- 其他
+ (NSDate *)dateWithLocalEN_USString:(NSString *)dateStr format:(NSString *)format {
    NSDateFormatter *outPuZYQormatter = [NSDate sharedDateFormatter];
    outPuZYQormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [outPuZYQormatter setDateFormat:format];
    return [outPuZYQormatter dateFromString:dateStr];
}
+ (NSDate *)dateWithString:(NSString *)dateStr format:(NSString *)format {
    NSDateFormatter *outPuZYQormatter = [NSDate sharedDateFormatter];
    [outPuZYQormatter setLocale:[NSLocale currentLocale]];
    [outPuZYQormatter setDateFormat:format];
    return [outPuZYQormatter dateFromString:dateStr];
}
#pragma mark -- 获得当前本地时间
+ (NSDate *)getCurrentDate{
    NSDate * date = [NSDate date];
    return [self getLocationDate:date];
}
+ (NSDate *)getLocationDate:(NSDate *)date {
    NSTimeZone *zone = [NSTimeZone systemTimeZone]; // 获得系统的时区
    NSTimeInterval time = [zone secondsFromGMTForDate:date];// 以秒为单位返回当前时间与系统格林尼治时间的差
    return  [date dateByAddingTimeInterval:time];// 然后把差的时间加上,就是当前系统准确的时间
}
@end
