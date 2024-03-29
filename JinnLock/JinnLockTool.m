/***************************************************************************************************
 **  Copyright © 2016年 Jinn Chang. All rights reserved.
 **  Giuhub: https://github.com/jinnchang
 **
 **  FileName: JinnLockTool.m
 **  Description: 密码管理工具
 **
 **  Author:  jinnchang
 **  Date:    2016/9/22
 **  Version: 1.0.0
 **  Remark:  Create New File
 **************************************************************************************************/

#import "JinnLockTool.h"
#import "JinnLockConfig.h"

@implementation JinnLockTool

#pragma mark - 手势密码管理

/**
 是否允许手势解锁(应用级别的)
 
 @return BOOL
 */
+ (BOOL)isGestureUnlockEnabled
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kJinnLockGestureUnlockEnabled];
}

/**
 设置是否允许手势解锁功能
 
 @param enabled enabled
 */
+ (void)setGestureUnlockEnabled:(BOOL)enabled
{
    [[NSUserDefaults standardUserDefaults] setBool:enabled forKey:kJinnLockGestureUnlockEnabled];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 当前已经设置的手势密码
 
 @return NSString
 */
+ (NSString *)currentGesturePasscode
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kJinnLockPasscode];
}

/**
 设置新的手势密码
 
 @param passcode passcode
 */
+ (void)setGesturePasscode:(NSString *)passcode
{
    [[NSUserDefaults standardUserDefaults] setObject:passcode forKey:kJinnLockPasscode];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - 指纹解锁管理

/**
 是否支持指纹识别(系统级别的)
 
 @return BOOL
 */
+ (BOOL)isTouchIdSupported
{
    NSError *error;
    
    return [[[LAContext alloc] init] canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
}

/**
 是否允许指纹解锁(应用级别的)
 
 @return BOOL
 */
+ (BOOL)isTouchIdUnlockEnabled
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kJinnLockTouchIdUnlockEnabled];
}

/**
 设置是否允许指纹解锁功能
 
 @param enabled enabled
 */
+ (void)setTouchIdUnlockEnabled:(BOOL)enabled
{
    [[NSUserDefaults standardUserDefaults] setBool:enabled forKey:kJinnLockTouchIdUnlockEnabled];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)isFaceID{
    if (@available(iOS 11.0, *)) {
        if ([[LAContext alloc] init].biometryType == LABiometryTypeTouchID) {
            return NO;
        }else{
            return YES;
        }
    }else{
        return NO;
    }
}

@end
