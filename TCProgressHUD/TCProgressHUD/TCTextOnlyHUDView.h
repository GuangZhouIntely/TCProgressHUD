//
//  TCTextOnlyHUDView.h
//  TCProgressHUD
//
//  Created by 童聪 on 2018/3/12.
//  Copyright © 2018年 intely. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCTextOnlyHUDView : UIView
/** 设置提示文字*/
@property (strong, nonatomic) NSString *text;
/** 设置文字颜色 */
@property (strong, nonatomic) UIColor *textColor;

@end
