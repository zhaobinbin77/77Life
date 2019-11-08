#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LCClient : NSObject
@property(nonatomic,weak)UINavigationController * lcCenterNav;
@property(nonatomic,weak)UITabBarController * lcCenterTabBar;
+ (LCClient *) sharedInstance;
@end
