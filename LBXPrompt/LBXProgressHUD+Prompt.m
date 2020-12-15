//
//  LBXProgressHUD+LBX.m
//
//
//  Created by lbxia on 16/1/7.
//  Copyright © 2016年 lbxia. All rights reserved.
//

#import "LBXProgressHUD+Prompt.h"

@implementation LBXProgressHUD (Prompt)

+ (void)showHudWithMessage:(NSString*)message icon:(UIImage*)icon onView:(UIView*)view
{
    if (view == nil) {
        return;
    }
    
    LBXProgressHUD* tmp = [LBXProgressHUD showHUDAddedTo:view animated:YES];
    
    if (icon) {
        // 设置图片
        tmp.customView = [[UIImageView alloc] initWithImage:icon];
        // 再设置模式
        tmp.mode = LBXProgressHUDModeCustomView;
    }
    
    //tmp.detailsLabelText = @"加载中";
    tmp.labelText = message;
    tmp.removeFromSuperViewOnHide = YES;
    
    CGFloat delayTime = MIN((float)message.length*0.06 + 0.3, 5.0);
    [tmp hide:YES afterDelay:delayTime];
}


+ (void)showHudWithMessage:(NSString*)message icon:(UIImage*)icon onView:(UIView*)view afterDelay:(NSTimeInterval)delay
{
    if (view == nil) {
        return;
    }
    
    LBXProgressHUD* tmp = [LBXProgressHUD showHUDAddedTo:view animated:YES];
    
    if (icon) {
        // 设置图片
        tmp.customView = [[UIImageView alloc] initWithImage:icon];
        // 再设置模式
        tmp.mode = LBXProgressHUDModeCustomView;
    }
    
    //tmp.detailsLabelText = @"加载中";
    tmp.labelText = message;
    tmp.removeFromSuperViewOnHide = YES;
    
    [tmp hide:YES afterDelay:delay];
}


+ (void)showErrorMessage:(NSString *)error onView:(UIView *)view{
   // [self show:error icon:@"error.png" view:view];
    
//    UIImage *icon = [UIImage imageNamed:@"LBXProgressHUD.bundle/error"];
    
//    [self showHudWithMessage:error icon:icon onView:view];
    
    [self showErrorMessage:error onView:view afterDelay:1.5];
}

+ (void)showErrorMessage:(NSString *)error onView:(UIView *)view afterDelay:(NSTimeInterval)delay
{
    
    UIImage *icon = [self errImageIcon];

    [self showHudWithMessage:error icon:icon onView:view afterDelay:delay];
}

+ (UIImage*)errImageIcon
{
    NSString *bundlePath = [[NSBundle bundleForClass:self.class] pathForResource:@"LBXProgressHUD" ofType:@"bundle"];
    NSString* imgPath = [NSString stringWithFormat:@"%@/%@",bundlePath, @"error"];

    UIImage *icon = [UIImage imageNamed:imgPath];
    return icon;
}

+ (void)showErrorMessage:(NSString *)error onView:(UIView *)view afterDelay:(NSTimeInterval)delay finish:(void(^)(void))block
{

    UIImage *icon = [self errImageIcon];

    
    [self showHudWithMessage:error icon:icon onView:view afterDelay:delay];
    
    if (block) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            block();
        });
    }
}

+ (UIImage*)successImageIcon
{
    NSString *bundlePath = [[NSBundle bundleForClass:self.class] pathForResource:@"LBXProgressHUD" ofType:@"bundle"];
    NSString* imgPath = [NSString stringWithFormat:@"%@/%@",bundlePath, @"success"];

    UIImage *icon = [UIImage imageNamed:imgPath];
    return icon;
}
+ (UIImage*)infoImageIcon
{
    NSString *bundlePath = [[NSBundle bundleForClass:self.class] pathForResource:@"LBXProgressHUD" ofType:@"bundle"];
    NSString* imgPath = [NSString stringWithFormat:@"%@/%@",bundlePath, @"info"];

    UIImage *icon = [UIImage imageNamed:imgPath];
    return icon;
}


+ (void)showSuccessMessage:(NSString *)success onView:(UIView *)view{
    // [self show:error icon:@"error.png" view:view];
    
    UIImage *icon = [self successImageIcon];
    
    [self showHudWithMessage:success icon:icon onView:view];
}

+ (void)showSuccessMessage:(NSString *)success onView:(UIView *)view afterDelay:(NSTimeInterval)delay{
    // [self show:error icon:@"error.png" view:view];
    
    UIImage *icon = [self successImageIcon];

    [self showHudWithMessage:success icon:icon onView:view afterDelay:delay];
}

+ (void)showSuccessMessage:(NSString *)success onView:(UIView *)view afterDelay:(NSTimeInterval)delay finish:(void(^)(void))block{
    // [self show:error icon:@"error.png" view:view];
    
    UIImage *icon = [self successImageIcon];

    [self showHudWithMessage:success icon:icon onView:view afterDelay:delay];
    
    if (block) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            block();
        });
    }
}

+ (void)showTipMessage:(NSString*)message onView:(UIView*)view
{
    UIImage *icon = [self infoImageIcon];
    
    [self showHudWithMessage:message icon:icon onView:view];
}

+ (void)showTipMessage:(NSString*)message onView:(UIView*)view afterDelay:(NSTimeInterval)delay
{
    UIImage *icon = [self infoImageIcon];

    [self showHudWithMessage:message icon:icon onView:view afterDelay:delay];
}

+ (void)showWaitingWithMessage:(NSString*)message onView:(UIView*)view
{
    LBXProgressHUD* tmp = [LBXProgressHUD showHUDAddedTo:view animated:YES];
    
    tmp.labelText = message;
    tmp.removeFromSuperViewOnHide = YES;
}

//隐藏最先找到的hud
+ (void)dismissWaitingWithView:(UIView*)view
{
    [LBXProgressHUD hideHUDForView:view animated:YES];
}

//隐藏所有的hud
+ (void)dismissAllHuds:(UIView*)view
{
    [LBXProgressHUD hideAllHUDsForView:view animated:YES];
}

@end
