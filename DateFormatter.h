#import <Foundation/Foundation.h>
@interface DateFormatter : NSObject
+ (NSString *)weekdayStringWithDate:(NSDate *)date;  
+ (NSDate *)dateFromTimeStampString:(NSString *)timeStamp;  
+ (NSString*) stringFromBirthday:(NSDate*)date;
+ (NSString*) stringFromStringYeayWeek:(NSDate*)date;
+ (NSString*) stringFromStringDay:(NSDate*)date;
+ (NSDate *)dateFromString:(NSString *)dateString; 
@end
