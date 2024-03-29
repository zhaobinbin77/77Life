#import "LCTabBarController.h"
#import "LCTabBar.h"
#import "LCNavigationViewController.h"
#import "HomeViewController.h"
#import "UserViewController.h"
#import "FoundViewController.h"
#import "NoteListViewController.h"
@interface LCTabBarController ()<UITabBarControllerDelegate>
@end
@implementation LCTabBarController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setValue:[LCTabBar new] forKey:@"tabBar"];
    NSMutableArray * controllerArray = [NSMutableArray new];
    [controllerArray addObject:[self addChildViewControllerWith:@"HomeViewController" title:@"" normalImage:@"tab_bar_home"]];
    [controllerArray addObject:[self addChildViewControllerWith:@"NoteListViewController" title:@"" normalImage:@"tab_bar_tool"]];
    [controllerArray addObject:[self addChildViewControllerWith:@"FoundViewController" title:@"" normalImage:@"tab_bar_found"]];
    [controllerArray addObject:[self addChildViewControllerWith:@"UserViewController" title:@"" normalImage:@"tab_bar_user"]];
    self.viewControllers = controllerArray;
    self.delegate = self;
}
-(LCNavigationViewController *)addChildViewControllerWith:(NSString *)className title:(NSString *)title  normalImage:(NSString *)normalImage{
    Class class = NSClassFromString(className);
    UIViewController * controller  = [class new];
    controller.title = title;
    controller.tabBarItem.image = [[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSString * selectedImage = [normalImage stringByAppendingString:@"_sel"];
    UIImage * image = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage = image;
    LCNavigationViewController * lcNav = [[LCNavigationViewController alloc] initWithRootViewController:controller];
    if ([className isEqualToString:@"HomeViewController"]) {
        [LCClient sharedInstance].lcCenterNav = lcNav;
    }
    return lcNav;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    [LCClient sharedInstance].lcCenterNav = (LCNavigationViewController *)viewController;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
