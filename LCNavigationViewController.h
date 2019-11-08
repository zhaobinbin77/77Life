#import <UIKit/UIKit.h>
@interface LCNavigationViewController : UINavigationController
@end
@interface LCNavigationTapView : UIView
@property(nonatomic,strong)UIImageView * bgView;
@property(nonatomic,strong)UIImageView * leftImageView;
@property(nonatomic,strong)UIView * tapLeftView;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UIImageView * rightImageView;
@end
