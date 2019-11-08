#import <Foundation/Foundation.h>
@interface LCRefresh : NSObject
+ (MJRefreshHeader *)lcRefreshHeader:(MJRefreshComponentRefreshingBlock)refreshingBlock;
+ (MJRefreshFooter *)lcRefreshFooter:(MJRefreshComponentRefreshingBlock)refreshingBlock;
@end
