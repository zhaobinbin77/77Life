#import "LCClient.h"
@implementation LCClient
+ (LCClient*) sharedInstance  
{
    static LCClient *sharedObj = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedObj = [[self alloc] init];
    });
    return sharedObj;
}
@end
