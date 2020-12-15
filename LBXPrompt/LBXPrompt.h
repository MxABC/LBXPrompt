//
//  TKTool.h
//  LBXKit
//
//  Created by lbxia on 2018/5/7.
//  Copyright © 2018年 lbxia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBXPrompt : NSObject

///toast
+ (void)showToastWithMessage:(NSString*)message;

/**
 显示等待Hud,默认延后20s自动消失，也可以调用hiddeHudView 主动隐藏
 */
+ (void)showHudWating;


/**
 显示hud及信息，默认延后20s自动消失，也可以调用hiddeHudView 主动隐藏

 @param message 信息
 */
+ (void)showHudWatingWithMessage:(NSString*)message;


/**
  显示hud及信息

 @param message 信息
 @param delaySeconds 延后多少s后自动消失
 */
+ (void)showHudWatingWithMessage:(NSString*)message delaySeconds:(NSInteger)delaySeconds;


///hidden hud
+ (void)hiddeHudView;

@end
