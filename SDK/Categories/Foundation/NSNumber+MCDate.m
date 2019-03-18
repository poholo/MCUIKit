//
// Created by 江明 赵 on 12/31/14.
// Copyright (c) 2014 江明 赵. All rights reserved.
//

#import "NSNumber+MCDate.h"

@implementation NSNumber (MCDate)

- (NSDate *)date {
    double secs = [self doubleValue] / 1000;
    return [NSDate dateWithTimeIntervalSince1970:secs];
}

- (NSString *)min {
    NSInteger seconds = [self integerValue];
    NSInteger deltaMinutes;
    if (seconds == 0) {
        deltaMinutes = 0;
    } else if (seconds < 60) {
        deltaMinutes = 1;
    } else {
        deltaMinutes = seconds / 60;
    }

    return [NSString stringWithFormat:@"%zd", deltaMinutes];
}

- (NSString *)dayText {
    NSInteger value = [self integerValue];
    NSInteger year = value / 10000;
    NSInteger month = (value - year * 10000) / 100;
    NSInteger day = (value - year * 10000) - month * 100;
    return [NSString stringWithFormat:@"%04zd%02zd%02zd", year, month, day];
}

- (NSString *)timeText {
    NSInteger seconds = [self integerValue];
    NSInteger deltaHours = seconds / (60 * 60);
    NSInteger deltaMinutes = (seconds - (deltaHours * 60 * 60)) / 60;
    NSInteger deltaSecond = (seconds - (deltaHours * 60 * 60) - (deltaMinutes * 60));

    if (deltaHours > 0) {
        return [NSString stringWithFormat:@"%02zd:%02zd:%02zd", deltaHours, deltaMinutes, deltaSecond];
    } else {
        return [NSString stringWithFormat:@"%02zd:%02zd", deltaMinutes, deltaSecond];
    }
}

- (NSString *)mSec {
    NSInteger seconds = [self integerValue] / 1000;
    NSInteger deltaHours = seconds / (60 * 60);
    NSInteger deltaMinutes = (seconds - (deltaHours * 60 * 60)) / 60;
    NSInteger deltaSecond = (seconds - (deltaHours * 60 * 60) - (deltaMinutes * 60));
    NSInteger msecound = [self integerValue] % 1000 / 10;
    if (deltaHours > 0) {
        return [NSString stringWithFormat:@"%02zd:%02zd:%02zd:%02zd", deltaHours, deltaMinutes, deltaSecond, msecound];
    } else {
        return [NSString stringWithFormat:@"%02zd:%02zd:%02zd", deltaMinutes>0?deltaMinutes:0, deltaSecond>0?deltaSecond:deltaSecond, msecound>0?msecound:0];
    }
}

- (NSString *)minSec {
    NSInteger seconds = [self integerValue];
    NSInteger deltaMinutes = seconds / 60;
    NSInteger deltaSecond = (seconds - (deltaMinutes * 60));

    return [NSString stringWithFormat:@"%02zd:%02zd", deltaMinutes, deltaSecond];
}

- (NSString *)mdText {
    NSInteger value = [self integerValue];
    NSInteger year = value / 10000;
    NSInteger month = (value - year * 10000) / 100;
    NSInteger day = (value - year * 10000) - month * 100;
    return [NSString stringWithFormat:@"%02zd-%02zd", month, day];
}

- (NSString *)ymdText {
    NSInteger value = [self integerValue];
    NSInteger year = value / 10000;
    NSInteger month = (value - year * 10000) / 100;
    NSInteger day = (value - year * 10000) - month * 100;
    return [NSString stringWithFormat:@"%04zd-%02zd-%02zd", year, month, day];
}

- (NSString *)timeNow {
    NSInteger seconds = [self integerValue];
    NSInteger deltaHours = seconds / (60 * 60);
    NSInteger deltaMinutes = (seconds - (deltaHours * 60 * 60)) / 60;
    NSInteger deltaSecond = (seconds - (deltaHours * 60 * 60) - (deltaMinutes * 60));

    if (deltaHours == 0 && deltaMinutes == 0) {
        return [NSString stringWithFormat:@"%02zd", deltaSecond];
    } else if (deltaHours == 0) {
        return [NSString stringWithFormat:@"%02zd:%02zd", deltaMinutes, deltaSecond];
    } else if (deltaMinutes < 60) {
        return [NSString stringWithFormat:@"%02zd:%02zd:%02zd", deltaHours, deltaMinutes, deltaSecond];
    }

    return [NSString string];
}

- (NSString *)timeNowInterval {
    NSInteger seconds = fabs([self doubleValue] / 1000 - [[NSDate new] timeIntervalSince1970]);
    NSInteger deltaDays = seconds / (60 * 60 * 24);
    NSInteger deltaHours = (seconds - deltaDays * 60 * 60 * 24) / (60 * 60);
    NSInteger deltaMinutes = (seconds - deltaDays * 60 * 60 * 24 - (deltaHours * 60 * 60)) / 60;

    if (seconds <= 0) {
        return nil;
    } else if (deltaDays == 0 && deltaHours == 0) {
        return [NSString stringWithFormat:@"%@分", @(deltaMinutes)];
    } else if (deltaDays == 0) {
        return [NSString stringWithFormat:@"%@小时%@分", @(deltaHours), @(deltaMinutes)];
    } else if (deltaMinutes < 60) {
        return [NSString stringWithFormat:@"%@天%@小时%@分", @(deltaDays), @(deltaHours), @(deltaMinutes)];
    }

    return [NSString string];
}

- (NSString *)timeLocalNow {
    NSInteger seconds = [self integerValue];
    NSInteger deltaHours = seconds / (60 * 60);
    NSInteger deltaMinutes = (seconds - (deltaHours * 60 * 60)) / 60;
    NSInteger deltaSecond = (seconds - (deltaHours * 60 * 60) - (deltaMinutes * 60));

    if (deltaHours == 0 && deltaMinutes == 0) {
        return [NSString stringWithFormat:@"%02zd秒", deltaSecond];
    } else if (deltaHours == 0) {
        return [NSString stringWithFormat:@"%02zd分%02zd秒", deltaMinutes, deltaSecond];
    } else if (deltaMinutes < 60) {
        return [NSString stringWithFormat:@"%02zd时%02zd分%02zd秒", deltaHours, deltaMinutes, deltaSecond];
    }

    return [NSString string];
}

- (NSString *)timeAgo {
    double secs = [[NSDate date] timeIntervalSince1970] - [self doubleValue] / 1000;
    double deltaSeconds = fabs(secs);
    double deltaMinutes = deltaSeconds / 60;

    int minutes;

    if (deltaSeconds < 5) {
        return @"刚刚";
    } else if (deltaSeconds < 60) {
        return [self stringFromFormat:@"%@秒前" withValue:deltaSeconds];
    } else if (deltaSeconds < 120) {
        return @"1分钟前";
    } else if (deltaMinutes < 60) {
        return [self stringFromFormat:@"%@分钟前" withValue:deltaMinutes];
    } else if (deltaMinutes < 120) {
        return @"1小时前";
    } else if (deltaMinutes < (24 * 60)) {
        minutes = (int) floor(deltaMinutes / 60);
        return [self stringFromFormat:@"%@小时前" withValue:minutes];
    } else if (deltaMinutes < (24 * 60 * 2)) {
        return @"昨天";
    } else if (deltaMinutes < (24 * 60 * 7)) {
        minutes = (int) floor(deltaMinutes / (60 * 24));
        return [self stringFromFormat:@"%@天前" withValue:minutes];
    } else if (deltaMinutes < (24 * 60 * 14)) {
        return @"上周";
    } else if (deltaMinutes < (24 * 60 * 31)) {
        minutes = (int) floor(deltaMinutes / (60 * 24 * 7));
        return [self stringFromFormat:@"%@周前" withValue:minutes];
    } else if (deltaMinutes < (24 * 60 * 61)) {
        return @"上月";
    } else if (deltaMinutes < (24 * 60 * 365.25)) {
        minutes = (int) floor(deltaMinutes / (60 * 24 * 30));
        return [self stringFromFormat:@"%@月前" withValue:minutes];
    } else if (deltaMinutes < (24 * 60 * 731)) {
        return @"去年";
    }

    minutes = (int) floor(deltaMinutes / (60 * 24 * 365));
    return [self stringFromFormat:@"%@年前" withValue:minutes];
}

- (NSString *)stringFromFormat:(NSString *)format withValue:(NSInteger)value {
    return [NSString stringWithFormat:format, @(value)];
}


- (NSString *)mmddHHMM {
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM月dd日 hh:mm"];
    }

    NSString *fromString = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:self.doubleValue / 1000]];
    return fromString;
}

- (NSString *)yyyyMMddHHmm {
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    }

    NSString *fromString = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:self.doubleValue / 1000]];
    return fromString;
}

- (NSString *)yyyy_MM_dd {
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    }

    NSString *fromString = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:self.doubleValue / 1000]];
    return fromString;
}

- (NSString *)timeInfo {

    double secs = [[NSDate date] timeIntervalSince1970] - [self doubleValue] / 1000;
    double deltaSeconds = fabs(secs);
    double deltaMinutes = deltaSeconds / 60;

    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
    }

    if (deltaMinutes < (24 * 60)) {
        [dateFormatter setDateFormat:@"HH:mm"];
    }else{
        [dateFormatter setDateFormat:@"yy-MM-dd"];
    }
    NSString *fromString = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:self.doubleValue / 1000]];
    return fromString;
}

- (NSString *)yyyyMMdd {
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    }

    NSString *fromString = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:self.doubleValue / 1000]];
    return fromString;
}

/**yyyy-MM-dd HH:mm*/
- (NSString *)yyyy_MM_ddHHmm {
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    }
    NSString *fromString = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:self.doubleValue / 1000]];
    return fromString;

}

/**yyyy-MM-dd HH:mm*/
- (NSString *)yyyy_MM_ddHHmmss {
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    NSString *fromString = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:self.doubleValue / 1000]];
    return fromString;

}

- (NSString *)mmddHHMM2 {
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM月dd日HH时mm"];
    }

    NSString *fromString = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:self.doubleValue / 1000]];
    return fromString;
}

+ (NSNumber *)compareCurrentTime:(NSDate *)compareDate {
    NSTimeInterval timeInterval = [compareDate timeIntervalSinceNow];
    double deltaSeconds = fabs(timeInterval);
    double deltaMinutes = deltaSeconds / 60;
    long temp = 0;

    if (deltaMinutes > (24 * 60)) {
        temp = deltaMinutes / (24 * 60);
    }
    return @(temp);
}

- (BOOL)isUpload {
    NSInteger launchTime = [[NSUserDefaults standardUserDefaults] integerForKey:@"launchtime"] * 1000;
    return ([self integerValue] > launchTime);
}

@end


#import <CoreGraphics/CoreGraphics.h>

@implementation NSNumber (Formart)
- (NSString *)commenNumber2String {
    if (self.integerValue < 10000) {
        return self.stringValue;
    } else {
        CGFloat number = self.integerValue / 10000.0f;
        return [NSString stringWithFormat:@"%.1fw", number];
    }
}


@end
