#import <Foundation/Foundation.h>
@class EventModel;
@interface EventModelTool : NSObject
+(NSMutableArray *)queryWithTime;
+(void)deleteTime:(int)ids;
+(void)insertTime:(EventModel *)diaryTime;
+(EventModel *)queryOneTime:(int)ids;
+(void)updataTime:(EventModel *)updataTime;
@end
