#import "LCSettings.h"
@implementation LCSettings
+(LCSettings *) sharedInstance{
    static LCSettings * settings =nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        settings =[[self alloc]init];
    });
    return settings;
}
- (id)objectForKey:(NSString *)key{
    if([key isEqualToString:kLaunchScreenModel]){ 
        if ([[NSUserDefaults standardUserDefaults] objectForKey:key]) {
            return [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:key]];
        }
        return nil;
    }else{
        return [[NSUserDefaults standardUserDefaults]objectForKey:key];
    }
}
- (void)setObject:(id)object forKey:(NSString*)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   if([key isEqualToString:kLaunchScreenModel]){
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object];
        [defaults setObject:data forKey:key];
    }else{
        [defaults setObject:object forKey:key];
    }
}
- (void)removeObjectForKey:(NSString *)key{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
    [defaults synchronize];
}
@end
