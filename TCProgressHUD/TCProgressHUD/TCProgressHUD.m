//
//  TCProgressHUD.m
//  TCProgressHUD
//
//  Created by 童聪 on 2018/3/12.
//  Copyright © 2018年 intely. All rights reserved.
//

#import "TCProgressHUD.h"
#import "TCPrivateHUDProtocol.h"
#import "TCTextOnlyHUDView.h"
#import "TCImageOnlyHUDView.h"
#import "TCTextAndImageHUDView.h"
#import "TCProgressHUDView.h"
#import "TCWeakTimer.h"

@interface TCProgressHUD ()

@property (nonatomic, weak) NSTimer *timer;

@end

@implementation TCProgressHUD (Public)

+ (void)showProgressWithStatus:(NSString *)status {
    TCProgressHUD *hudView = [TCProgressHUD sharedInstance];
    TCProgressHUDView *progressView = [[TCProgressHUDView alloc] init];
    [progressView setText:status];
    [hudView setHudView:progressView];
    [hudView showWithTime:0.0f];
    [progressView startAnimation];
    
}

+ (void)showProgress {
    [TCProgressHUD showProgressWithStatus:nil];
}
+ (void)showStatus:(NSString *)status andAutoHideAfterTime:(CGFloat)showTime {
    
    TCProgressHUD *hudView = [TCProgressHUD sharedInstance];
    TCTextOnlyHUDView *textView = [[TCTextOnlyHUDView alloc] init];
    
    textView.text = status;
    [hudView setHudView:textView];
    [hudView showWithTime:showTime];
}

+ (void)showStatus:(NSString *)status {
    [TCProgressHUD showStatus:status andAutoHideAfterTime:0.0f];
}


+ (void)showImage:(UIImage *)image withStatus:(NSString *)status andAutoHideAfterTime:(CGFloat)showTime {
    TCProgressHUD *hudView = [TCProgressHUD sharedInstance];
    TCTextAndImageHUDView *textAndImageView = [[TCTextAndImageHUDView alloc] init];
    [textAndImageView setText:status andImage:image];
    [hudView setHudView:textAndImageView];
    [hudView showWithTime:showTime];
}

+ (void)showSuccessWithStatus:(NSString *)status andAutoHideAfterTime:(CGFloat)showTime {
    UIImage *image = [UIImage imageNamed:@"success"];
    [TCProgressHUD showImage:image withStatus:status andAutoHideAfterTime:showTime];
}

+ (void)showSuccessWithStatus:(NSString *)status {
    [TCProgressHUD showSuccessWithStatus:status andAutoHideAfterTime:0.0f];
}


+ (void)showSuccessAndAutoHideAfterTime:(CGFloat)showTime {
    UIImage *image = [UIImage imageNamed:@"success"];
    [TCProgressHUD showImage:image andAutoHideAfterTime:showTime];
}

+ (void)showSuccess {
    [TCProgressHUD showSuccessAndAutoHideAfterTime:0.0f];
}

+ (void)showErrorWithStatus:(NSString *)status andAutoHideAfterTime:(CGFloat)showTime {
    UIImage *image = [UIImage imageNamed:@"error"];
    [TCProgressHUD showImage:image withStatus:status andAutoHideAfterTime:showTime];
}

+ (void)showErrorWithStatus:(NSString *)status {
    [TCProgressHUD showErrorWithStatus:status andAutoHideAfterTime:0.0f];
}

+ (void)showErrorAndAutoHideAfterTime:(CGFloat)showTime {
    UIImage *image = [UIImage imageNamed:@"error"];
    [TCProgressHUD showImage:image andAutoHideAfterTime:showTime];
}

+ (void)showError {
    [TCProgressHUD showErrorAndAutoHideAfterTime:0.0f];
}


+ (void)hideHUD {
    [[TCProgressHUD sharedInstance] hide];
    
    //    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    //    if (window) {
    //        NSEnumerator *reveseSubviews = [window.subviews reverseObjectEnumerator];
    //
    //        for (UIView *subview in reveseSubviews) {
    //            if ([subview isKindOfClass:[TCProgressHUD class]]) {
    //                [subview removeFromSuperview];
    //                break;
    //            }
    //        }
    //    }
}

+ (void)hideAllHUDs {
    [[TCProgressHUD sharedInstance] hideAllHUDs];
    //    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    //    if (window) {
    //        for (UIView *subview in window.subviews) {
    //            if ([subview isKindOfClass:[TCProgressHUD class]]) {
    //                [subview removeFromSuperview];
    //            }
    //        }
    //    }
}

+ (void)showCustomHUD:(UIView *)hudView andAutoHideAfterTime:(CGFloat)showTime {
    
    [[TCProgressHUD sharedInstance] setHudView:hudView];
    [[TCProgressHUD sharedInstance] showWithTime:showTime];
}

+ (void)showCustomHUD:(UIView *)hudView {
    [TCProgressHUD showCustomHUD:hudView andAutoHideAfterTime:0.0f];
}

+ (void)showImage:(UIImage *)image andAutoHideAfterTime:(CGFloat)showTime {
    TCProgressHUD *hudView = [TCProgressHUD sharedInstance];
    TCImageOnlyHUDView *imageView = [[TCImageOnlyHUDView alloc] init];
    imageView.image = image;
    [hudView setHudView:imageView];
    [hudView showWithTime:showTime];
}



@end


@implementation TCProgressHUD


+ (instancetype)sharedInstance {
    static TCProgressHUD *hud = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [[TCProgressHUD alloc] init];
    });
    
    return hud;
}

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)showWithTime:(CGFloat)time {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    if (self.superview == nil) {
        [window addSubview:self];
    }
    if (time > 0) {
//        __weak typeof(self) weakself = self;
//        delay(time, ^{
//            __strong typeof(weakself) strongSelf = weakself;
//            if (strongSelf) {
//                [strongSelf hide];
//            }
//            //            [[TCProgressHUD sharedInstance] hide];
//        });
//        NSTimer *timer = [TCWeakTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(hide) userInfo:nil repeats:NO];
//        [timer fire];
//        self.timer = timer;
        
        NSTimer *timer = [NSTimer timerWithTimeInterval:3.0f target:self selector:@selector(hide) userInfo:nil repeats:NO];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    }
}

- (void)hide {
    
    NSLog(@"哈哈");
    
    /// 首先移除先添加的
    UIView *firstHud = [self.subviews firstObject];
    if (firstHud) {
        [firstHud removeFromSuperview];
        if (self.subviews.count == 0) {
            [self removeFromSuperview];
        }
    }
    else {
        [self removeFromSuperview];
    }
    [self.timer invalidate];
    self.timer = nil;
}

- (void)hideAllHUDs {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self removeFromSuperview];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.superview) {// superView == window
        self.frame = self.superview.bounds;
        for (UIView *subview in self.subviews) {
            if ([subview conformsToProtocol:@protocol(TCPrivateHUDProtocol)]) {
                /// 居中显示
                subview.center = self.center;
            }
            else {
                /// 自定义的hudView
                CGRect frame = subview.frame;
                subview.frame = frame;
                
            }
        }
    }
}
/// 这里直接使用了GCD, 当然推荐使用NSTimer
//static void delay(CGFloat time, dispatch_block_t block) {
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        if (block) {
//            block();
//        }
//    });
//}


- (void)setHudView:(UIView *)hudView {
    [self addSubview:hudView];
}


@end
