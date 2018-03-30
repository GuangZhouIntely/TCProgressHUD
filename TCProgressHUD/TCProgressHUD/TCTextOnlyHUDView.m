//
//  TCTextOnlyHUDView.m
//  TCProgressHUD
//
//  Created by 童聪 on 2018/3/12.
//  Copyright © 2018年 intely. All rights reserved.
//

#import "TCTextOnlyHUDView.h"
#import "TCPrivateHUDProtocol.h"
@interface TCTextOnlyHUDView ()<TCPrivateHUDProtocol>
@property (strong, nonatomic) UILabel *label;

@end

@implementation TCTextOnlyHUDView


- (instancetype)init {
    if (self = [super init]) {
        [self commonInit];
        
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}


- (void)commonInit {
    [self addSubview:self.label];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.85];
    self.layer.cornerRadius = 10.0f;
    self.layer.masksToBounds = YES;
}

- (void)dealloc {
    //    NSLog(@"text----dealloc");
}

- (void)layoutSubviews {
    self.label.frame = self.bounds;
}


- (void)setText:(NSString *)text {
    self.label.text = text;
    const CGFloat padding = 10.0f;
    CGRect textRect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 100.0f) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.label.font} context:nil];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    CGRect frame = self.frame;
    frame.size.width = textRect.size.width + 2*padding;
    if (frame.size.width > screenWidth) {
        frame.size.width = screenWidth - 2*padding;
    }
    frame.origin.x = (screenWidth - frame.size.width)/2;
    frame.size.height = textRect.size.height + 2*padding;
    frame.origin.y = (screenHeight - frame.size.height)/2;
    
    self.frame = frame;
    [self layoutIfNeeded];
}

- (void)setTextColor:(UIColor *)textColor {
    self.label.textColor = textColor;
}

- (UILabel *)label {
    if (!_label) {
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.numberOfLines = 0;
        label.font = [UIFont boldSystemFontOfSize:17.0];
        _label = label;
    }
    
    return _label;
}

@end
