//
//  TCImageOnlyHUDView.m
//  TCProgressHUD
//
//  Created by 童聪 on 2018/3/12.
//  Copyright © 2018年 intely. All rights reserved.
//

#import "TCImageOnlyHUDView.h"

#import "TCImageOnlyHUDView.h"
#import "TCPrivateHUDProtocol.h"
@interface TCImageOnlyHUDView ()<TCPrivateHUDProtocol>
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation TCImageOnlyHUDView


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
    [self addSubview:self.imageView];
    self.layer.cornerRadius = 10.0f;
    self.layer.masksToBounds = YES;
    [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.85]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = CGRectMake((self.bounds.size.width-self.image.size.width)/2, (self.bounds.size.height-self.image.size.height)/2, self.image.size.width, self.image.size.height);
}


- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
    CGRect frame = self.frame;
    frame.size = CGSizeMake(image.size.width+40, image.size.height+40);
    self.frame = frame;
    [self layoutIfNeeded];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.backgroundColor = [UIColor clearColor];
        _imageView = imageView;
    }
    
    return _imageView;
}



@end
