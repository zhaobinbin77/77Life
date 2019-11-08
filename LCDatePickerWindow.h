#import <Foundation/Foundation.h>
@interface LCDatePickerWindow : NSObject
@property (nonatomic, strong) UIDatePicker * datePicker;
@property (nonatomic,strong) UIButton * cancelButton;
@property (nonatomic,strong) UIButton * enterButton;
@property(nonatomic,assign)BOOL hided;
-(void)show;
-(void)hide;
@end
