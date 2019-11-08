#import <Foundation/Foundation.h>
@interface WeatherManager : NSObject
+ (WeatherManager*) sharedInstance;
@property (nonatomic,strong) NSString * latitude;
@property (nonatomic,strong) NSString * longitude;
@property (nonatomic,strong) NSString * weatherIconIndex;
@end
