//
//  ViewController.m
//  TCProgressHUD
//
//  Created by 童聪 on 2018/3/12.
//  Copyright © 2018年 intely. All rights reserved.
//

#import "ViewController.h"
#import "TCProgressHUD.h"
#import "TCTextOnlyHUDView.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray<NSString *> *titlesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *const kCellID = @"kCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID];
    }
    cell.textLabel.text = self.titlesArray[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [TCProgressHUD showStatus:@"正在努力加载中..."];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 加载完后 移除提示框
                [TCProgressHUD hideHUD];
            });
            break;
        case 1:
            [TCProgressHUD showStatus:@"正在努力加载中..." andAutoHideAfterTime:3.0];
            break;
        case 2:
            
            [TCProgressHUD showSuccess];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 加载完后 移除提示框
                [TCProgressHUD hideHUD];
            });
            break;
        case 3:
            [TCProgressHUD showSuccessAndAutoHideAfterTime:1.f];
            break;
        case 4:
            [TCProgressHUD showSuccessWithStatus:@"加载成功!!"];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 加载完后 移除提示框
                [TCProgressHUD hideHUD];
            });
            break;
        case 5:
            // 显示加载成功的图片和文字提示, 1s后自动隐藏
            [TCProgressHUD showSuccessWithStatus:@"加载成功!!" andAutoHideAfterTime:1.f];
            
            break;
        case 6:
            [TCProgressHUD showProgress];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 加载完后 移除提示框
                [TCProgressHUD hideHUD];
            });
            break;
        case 7:
            // 显示加载动画, 需要加载完成后调用hideHUD隐藏
            [TCProgressHUD showProgressWithStatus:@"正在努力加载中..."];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // 加载完后 移除提示框
                [TCProgressHUD hideHUD];
            });
            break;
        case 8: {
            /// 内部的HUDView是遵守TCPrivateHUDProtocol的, 在显示的时候会被调整为居中显示
            TCTextOnlyHUDView *custom = [[TCTextOnlyHUDView alloc] init];
            
            custom.text = @"这是自定义的";
            custom.textColor = [UIColor blueColor];
            
            [TCProgressHUD showCustomHUD:custom andAutoHideAfterTime:1.0];
            
        }
            break;
        case 9: {
            // 不遵守TCPrivateHUDProtocol的, 在显示的时候会使用这里设置的frame
            UILabel *custom = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
            custom.textColor = [UIColor blueColor];
            custom.text = @"这是自定义的";
            custom.backgroundColor = [UIColor blackColor];
            
            [TCProgressHUD showCustomHUD:custom andAutoHideAfterTime:1.0];
        }
            break;
            
        default:
            break;
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


- (NSArray<NSString *> *)titlesArray {
    if (!_titlesArray) {
        _titlesArray = @[@"提示文字, 不会自动隐藏", @"提示文字, 会自动隐藏", @"提示成功 显示默认的图片, 不会自动隐藏", @"提示成功 显示默认的图片, 会自动隐藏", @"提示成功 显示默认的图片和设定的文字提示, 不会自动隐藏", @"提示成功 显示默认的图片和设定的文字提示, 会自动隐藏", @"提示正在加载 显示默认的图片 不会自动隐藏", @"提示正在加载 显示默认的图片和文字提示 不会自动隐藏", @"弹出自定义的提示框 不会自动隐藏", @"弹出自定义的提示框 会自动隐藏"];
    }
    return _titlesArray;
}

@end
