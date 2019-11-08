#import "LCRefresh.h"
@implementation LCRefresh
+ (MJRefreshHeader *)lcRefreshHeader:(MJRefreshComponentRefreshingBlock)refreshingBlock{
    MJRefreshStateHeader * header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
        refreshingBlock();
    }];
    return header;
}
+ (MJRefreshFooter *)lcRefreshFooter:(MJRefreshComponentRefreshingBlock)refreshingBlock{
    MJRefreshBackStateFooter * footer = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
        refreshingBlock();
    }];
    return footer;
}
@end
