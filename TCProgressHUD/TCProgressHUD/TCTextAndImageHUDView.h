//
//  TCTextAndImageHUDView.h
//  TCProgressHUD
//
//  Created by 童聪 on 2018/3/12.
//  Copyright © 2018年 intely. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCTextAndImageHUDView : UIView

/** 设置文字颜色 */
@property (strong, nonatomic) UIColor *textColor;
/** 设置提示文字和图片*/
- (void)setText:(NSString *)text andImage:(UIImage *)image;

@end
