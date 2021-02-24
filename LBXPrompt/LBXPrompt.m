//
//  TKTool.m
//  LBXKit
//
//  Created by lbxia on 2018/5/7.
//  Copyright © 2018年 lbxia. All rights reserved.
//

#import "LBXPrompt.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UIView+LBXToast.h"
#import "LBXProgressHUD+Prompt.h"


@implementation LBXPrompt

+ (instancetype)sharedManager
{
    static LBXPrompt* _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[LBXPrompt alloc] init];
        
    });
    
    return _sharedInstance;
}

- (void)hiddeHudView
{
    [LBXPrompt hiddeHudView];
}

- (void)delayHiddHudView:(NSInteger)delaySeconds
{
    [self performSelector:@selector(hiddeHudView) withObject:nil afterDelay:delaySeconds];
}

- (void)cancelDelayHiddHudView
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

+ (void)showToastWithMessage:(NSString*)message
{
    if (message == nil) {
        message = @"";
    }
    
    if ([NSThread isMainThread]) {
        
        //tip
        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        [window makeToast:message
                 duration:2
                 position:LBXCSToastPositionCenter];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
    
            UIWindow * window = [[UIApplication sharedApplication] keyWindow];
            [window makeToast:message
                     duration:2
                     position:LBXCSToastPositionCenter];
        });
    }
}


+ (void)showHudWatingWithMessage:(NSString*)message
{
    if ([NSThread isMainThread]) {
        [self showHudWatingWithMessage:message delaySeconds:20];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            // 更新界面
            [self showHudWatingWithMessage:message delaySeconds:20];
        });
    }
}

+ (void)showNoDelayHudWatingWithMessage:(NSString*)message
{
    if ([NSThread isMainThread]) {
        [self showHudWatingWithMessage:message delaySeconds:10000];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            // 更新界面
            [self showHudWatingWithMessage:message delaySeconds:20];
        });
    }
}

+ (void)showHudWatingWithMessage:(NSString*)message delaySeconds:(NSInteger)delaySeconds
{
    if ([NSThread isMainThread]) {
       
        [[LBXPrompt sharedManager]cancelDelayHiddHudView];
        
        [self hiddeHudView];
        
        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        [LBXProgressHUD showWaitingWithMessage:message onView:window];
        if (delaySeconds > 0) {
            [[LBXPrompt sharedManager]delayHiddHudView:delaySeconds];
        }
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
           
            [[LBXPrompt sharedManager]cancelDelayHiddHudView];
            
            [self hiddeHudView];
            
            UIWindow * window = [[UIApplication sharedApplication] keyWindow];
            [LBXProgressHUD showWaitingWithMessage:message onView:window];
            
            if (delaySeconds > 0) {
                [[LBXPrompt sharedManager]delayHiddHudView:delaySeconds];
            }
        });
    }
}

+ (void)showHudWating
{
    [self showHudWatingWithMessage:@""];
}

+ (void)showNoDelayHudWating
{
    [self showHudWatingWithMessage:@"" delaySeconds:-1];
}

+ (void)hiddeHudView
{
    if ([NSThread isMainThread]) {
        
        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        [LBXProgressHUD hideHUDForView:window animated:NO];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIWindow * window = [[UIApplication sharedApplication] keyWindow];
            [LBXProgressHUD hideHUDForView:window animated:NO];
        });
    }
}

@end
