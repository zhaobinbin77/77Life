/*
#import "StartFigureManager.h"
#import "LCWebViewViewController.h"
@implementation LaunchAdModel
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.content forKey:@"content"];
    [aCoder encodeObject:self.openUrl forKey:@"openUrl"];
    [aCoder encodeObject:self.contentSize forKey:@"contentSize"];
    [aCoder encodeObject:self.duration forKey:@"duration"];
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        if ([aDecoder containsValueForKey:@"content"])
            self.content = [aDecoder decodeObjectForKey:@"content"];
        if ([aDecoder containsValueForKey:@"openUrl"])
            self.openUrl = [aDecoder decodeObjectForKey:@"openUrl"];
        if ([aDecoder containsValueForKey:@"contentSize"])
            self.contentSize = [aDecoder decodeObjectForKey:@"contentSize"];
        if ([aDecoder containsValueForKey:@"duration"])
            self.duration = [aDecoder decodeObjectForKey:@"duration"];
    }
    return self;
}
@end
@implementation StartFigureManager
+(void)load{
    [self shareManager];
}
+(StartFigureManager *)shareManager{
    static StartFigureManager *instance = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken,^{
        instance = [[StartFigureManager alloc] init];
    });
    return instance;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            [self setupXHLaunchAd];
            [self getWelcomePhoto];
        }];
    }
    return self;
}
-(void)getWelcomePhoto{
    NSString * url = @"https://www.gezhipu.com/services/LifeCollectionAD.json";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LaunchAdModel * launchAdModel = [LaunchAdModel yy_modelWithDictionary:responseObject[@"data"]];
        if (launchAdModel) {
            [[LCSettings sharedInstance] setObject:launchAdModel forKey:kLaunchScreenModel];
            if(launchAdModel.content.length > 0 && ![XHLaunchAd checkImageInCacheWithURL:[NSURL URLWithString:launchAdModel.content]]) {
                [XHLaunchAd downLoadImageAndCacheWithURLArray:@[[NSURL URLWithString:launchAdModel.content]]];
            }
        }else{
            [[LCSettings sharedInstance] setObject:nil forKey:kLaunchScreenModel];
        }
    } failure:nil];
}
#pragma mark - 图片开屏广告-网络数据-示例
-(void)setupXHLaunchAd{
    LaunchAdModel * model =  [[LCSettings sharedInstance] objectForKey:kLaunchScreenModel];
    XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration new];
    imageAdconfiguration.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height * 0.82);
    if([XHLaunchAd checkImageInCacheWithURL:[NSURL URLWithString:model.content]]){
        imageAdconfiguration.duration = [model.duration integerValue];
        imageAdconfiguration.imageNameOrURLString = model.content;
    }else{
        imageAdconfiguration.duration = 5;
        imageAdconfiguration.imageNameOrURLString = @"startup.png";
    }
    imageAdconfiguration.GIFImageCycleOnce = NO;
    imageAdconfiguration.imageOption = XHLaunchAdImageDefault;
    imageAdconfiguration.contentMode = UIViewContentModeScaleAspectFill;
    imageAdconfiguration.openModel = model.openUrl;
    imageAdconfiguration.showFinishAnimate =ShowFinishAnimateLite;
    imageAdconfiguration.showFinishAnimateTime = 0.8;
    imageAdconfiguration.skipButtonType = SkipTypeRoundProgressText;
    imageAdconfiguration.showEnterForeground = NO;
    [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self];
}
#pragma mark - XHLaunchAd delegate - 其他
-(void)xhLaunchAd:(XHLaunchAd *)launchAd clickAndOpenModel:(id)openModel clickPoint:(CGPoint)clickPoint{
    if(openModel==nil) return;
    LCWebViewViewController *VC = [[LCWebViewViewController alloc] init];
    NSString *urlString = (NSString *)openModel;
    VC.urlStr = urlString;
    UIViewController* rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    [rootVC.navigationController pushViewController:VC animated:YES];
}
@end
*/
