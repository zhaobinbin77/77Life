#import "DateFormatter.h"
@implementation DateFormatter
+ (NSString *)weekdayStringWithDate:(NSDate *)date {
    NSDateComponents *componets = [[NSCalendar autoupdatingCurrentCalendar] components:NSCalendarUnitWeekday fromDate:date];
    NSInteger weekday = [componets weekday];
    NSArray *weekArray = @[@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六"];
    NSString *weekStr = weekArray[weekday-1];
    return weekStr;
}
+ (NSDate *)dateFromTimeStampString:(NSString *)timeStamp{
    NSTimeInterval time;
    if (timeStamp.length == 10) {
        time=[timeStamp doubleValue];
    }else{
        time=[timeStamp doubleValue]/1000;
    }
    NSDate *destDate= [NSDate dateWithTimeIntervalSince1970:time];
    return destDate;
}
+ (NSString*) stringFromBirthday:(NSDate*)date{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *result = [dateFormatter stringFromDate:date];
    return result;
}
+ (NSString*) stringFromStringYeayWeek:(NSDate*)date{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];
    [dateFormatter setDateFormat:@"yyyy年MM月"];
    NSString *result = [dateFormatter stringFromDate:date];
    return result;
}
+ (NSString*) stringFromStringDay:(NSDate*)date{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT+0800"]];
    [dateFormatter setDateFormat:@"dd"];
    NSString *result = [dateFormatter stringFromDate:date];
    return result;
}
+ (NSDate *)dateFromString:(NSString *)dateString{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}
@end
