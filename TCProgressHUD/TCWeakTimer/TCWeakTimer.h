//
//  TCWeakTimer.h
//  test-NSTimer
//
//  Created by 童聪 on 2018/3/22.
//  Copyright © 2018年 intely. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TCTimerHandler)(id userInfo);

@interface TCWeakTimer : NSObject


/**
 创建NSTimer,并且默认把NSTimer以NSDefaultRunLoopMode添加到主Runloop上，并且立即执行一次
 */
+ (NSTimer *) scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats;

/**
 创建NSTimer,需要手动添加到Runloop上，模式自定义
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      block:(TCTimerHandler)block
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats;

/**
 创建NSTimer,并且默认把NSTimer以NSDefaultRunLoopMode添加到主Runloop上，并且立即执行一次
 */
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)interval target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)repeats;

@end
