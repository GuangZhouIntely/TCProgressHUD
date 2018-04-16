# TCProgressHUD

#### 提示文字, 不会自动隐藏
+ (void)showStatus:(NSString *)status;
#### 提示文字, 会自动隐藏
+ (void)showStatus:(NSString *)status andAutoHideAfterTime:(CGFloat)showTime;
#### 提示成功 显示默认的图片, 不会自动隐藏
+ (void)showSuccess;
#### 提示成功 显示默认的图片, 会自动隐藏
+ (void)showSuccessAndAutoHideAfterTime:(CGFloat)showTime;
#### 提示成功 显示默认的图片, 同时显示设定的文字提示, 不会自动隐藏
+ (void)showSuccessWithStatus:(NSString *)status;
#### 提示成功 显示默认的图片, 同时显示设定的文字提示, 会自动隐藏
+ (void)showSuccessWithStatus:(NSString *)status andAutoHideAfterTime:(CGFloat)showTime;
#### 提示失败 显示默认的图片, 不会自动隐藏
+ (void)showError;
#### 提示失败 显示默认的图片, 会自动隐藏
+ (void)showErrorAndAutoHideAfterTime:(CGFloat)showTime;
#### 提示失败 显示默认的图片, 同时显示设定的文字提示, 不会自动隐藏
+ (void)showErrorWithStatus:(NSString *)status;
#### 提示失败 显示默认的图片, 同时显示设定的文字提示, 会自动隐藏
+ (void)showErrorWithStatus:(NSString *)status andAutoHideAfterTime:(CGFloat)showTime;
#### 提示正在加载 显示默认的图片 不会自动隐藏
+ (void)showProgress;
#### 提示正在加载 显示默认的图片, 同时显示设定的文字提示 不会自动隐藏
+ (void)showProgressWithStatus:(NSString *)status;
#### 弹出自定义的提示框 不会自动隐藏
+ (void)showCustomHUD:(UIView *)hudView;
#### 弹出自定义的提示框 会自动隐藏
+ (void)showCustomHUD:(UIView *)hudView andAutoHideAfterTime:(CGFloat)showTime;
#### 移除提示框
+ (void)hideHUD;
#### 移除所有提示框
+ (void)hideAllHUDs;


### 实例：
```
 [TCProgressHUD showStatus:@"正在努力加载中..."];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 加载完后 移除提示框
                [TCProgressHUD hideHUD];
            });
```
