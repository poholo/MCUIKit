#import "NSDate+MCAgo.h"

@implementation NSDate (MCAgo)

- (NSString *)timeAgo {
    NSDate *now = [NSDate date];
    double deltaSeconds = fabs([self timeIntervalSinceDate:now]);
    double deltaMinutes = deltaSeconds / 60.0f;

    int minutes;

    if (deltaSeconds < 5) {
        return @"刚刚";
    } else if (deltaSeconds < 60) {
        return [NSString stringWithFormat:@"%d秒前", (int) deltaSeconds];
    } else if (deltaSeconds < 120) {
        return @"1分钟前";
    } else if (deltaMinutes < 60) {
        return [NSString stringWithFormat:@"%d分钟前", (int) deltaMinutes];
    } else if (deltaMinutes < 120) {
        return @"1小时前";
    } else if (deltaMinutes < (24 * 60)) {
        minutes = (int) floor(deltaMinutes / 60);
        return [NSString stringWithFormat:@"%d小时前", minutes];
    } else if (deltaMinutes < (24 * 60 * 2)) {
        return @"昨天";
    } else if (deltaMinutes < (24 * 60 * 7)) {
        minutes = (int) floor(deltaMinutes / (60 * 24));
        return [NSString stringWithFormat:@"%d天前", minutes];
    } else if (deltaMinutes < (24 * 60 * 14)) {
        return @"1周前";
    } else {
        static NSDateFormatter *dateFormatter;
        if (!dateFormatter) {
            dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateFormat = @"yyyy-MM-dd";
        }

        return [dateFormatter stringFromDate:self];
    }
}

- (NSString *)timeFormate {

    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
    }
    if ([self dateIsToday:self]) {
        [dateFormatter setDateFormat:@"aa hh:mm"];
    } else if ([self isYesterday]) {
        return @"昨天";
    } else if ((([self intervalSinceNow:self] >= [self getTodayisWeek]) && ([self intervalSinceNow:self] < [self getTodayisWeek] + 7)) || (([self intervalSinceNow:self] < 7) && ([self intervalSinceNow:self] < [self getTodayisWeek]))) {
        [dateFormatter setDateFormat:@"EEEE"];
    } else if (![self isThisYear]) {
        [dateFormatter setDateFormat:@"yy-MM-dd"];
    }
    return [dateFormatter stringFromDate:self];
}

//当天
- (BOOL)dateIsToday:(NSDate *)aDate {
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:components];
    components = [cal components:(NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:aDate];
    NSDate *otherDate = [cal dateFromComponents:components];

    if ([today isEqualToDate:otherDate]) {
        return YES;
    } else {
        return NO;
    }
}

//昨天
- (BOOL)isYesterday {
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *dateStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:now];
    NSDate *date = [fmt dateFromString:dateStr];
    now = [fmt dateFromString:nowStr];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:now options:0];

    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

//今年
- (BOOL)isThisYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 获得某个时间的年月日时分秒
    NSDateComponents *dateCmps = [calendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    return dateCmps.year == nowCmps.year;
}

//本周或者上周判断
- (int)intervalSinceNow:(NSDate *)theDate {
    NSTimeInterval late = [theDate timeIntervalSince1970] * 1;

    NSDate *dat = [NSDate dateWithTimeIntervalSinceNow:0];
    dat = [self getNowDateFromatAnDate:dat];
    NSTimeInterval now = [dat timeIntervalSince1970] * 1;
    NSString *timeString = @"";

    NSTimeInterval cha = now - late;

    if (cha / 86400 > 1) {
        timeString = [NSString stringWithFormat:@"%f", cha / 86400];
        timeString = [timeString substringToIndex:timeString.length - 7];
        return [timeString intValue];
    }
    return -1;

}

- (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate {
    //设置源日期时区
    NSTimeZone *sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone *destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate *destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}

- (int)getTodayisWeek {
    NSDate *today = [NSDate date];
    today = [self getNowDateFromatAnDate:today];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    [comps setWeekday:0];
    comps = [calendar components:(NSCalendarUnitWeekday) fromDate:today];
    NSInteger weekday = [comps weekday]; // 星期几（注意，周日是“1”，周一是“2”。。。。）
    int factWeekDay;
    //默认是周日开始
    switch (weekday) {
        case 1:
            factWeekDay = 7;
            break;
        case 2:
            factWeekDay = 1;
            break;
        case 3:
            factWeekDay = 2;
            break;
        case 4:
            factWeekDay = 3;
            break;
        case 5:
            factWeekDay = 4;
            break;
        case 6:
            factWeekDay = 5;
            break;
        case 7:
            factWeekDay = 6;
            break;
        default:
            break;
    }

    return factWeekDay;
}
@end
