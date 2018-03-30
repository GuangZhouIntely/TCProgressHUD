//
//  TCProgressHUDView.h
//  TCProgressHUD
//
//  Created by 童聪 on 2018/3/12.
//  Copyright © 2018年 intely. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCProgressHUDView : UIView

/** 设置颜色 */
@property (strong, nonatomic) UIColor *indicatorColor;
/** 开始动画 */
- (void)startAnimation;
/** 设置文字提示 */
- (void)setText:(NSString *)text;

@end
