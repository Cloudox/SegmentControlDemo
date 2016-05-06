//
//  ViewController.m
//  SegmentControlDemo
//
//  Created by Cloudox on 16/5/4.
//  Copyright © 2016年 Cloudox. All rights reserved.
//

#import "ViewController.h"

//设备的宽高
#define SCREENHEIGHT      [UIScreen mainScreen].bounds.size.height
#define SCREENWIDTH       [UIScreen mainScreen].bounds.size.width
//获取颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)
#define cmGreen RGB(0x32, 0xAB, 0x64)
//根据十六进制数来设置颜色
#define kUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()

@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化，添加分段名，会自动布局
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"正在销售", @"已下架"]];
    self.segmentedControl.frame = CGRectMake(-5, 50, SCREENWIDTH+10, 30);
    
    // 设置整体的色调
    self.segmentedControl.tintColor = cmGreen;
    
    // 设置分段名的字体
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:cmGreen,NSForegroundColorAttributeName,[UIFont systemFontOfSize:18],NSFontAttributeName ,nil];
    [self.segmentedControl setTitleTextAttributes:dic forState:UIControlStateNormal];

    // 设置初始选中项
    self.segmentedControl.selectedSegmentIndex = 0;
    
    [self.segmentedControl addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventValueChanged];// 添加响应方法
    
    // 设置样式的segmentedControlStyle属性在iOS 7.0之后将不再起作用
    
    // 设置点击后恢复原样，默认为NO，点击后一直保持选中状态
//    self.segmentedControl.momentary = YES;
    
    // 在指定序号处插入一个分段，会自动布局
//    [self.segmentedControl insertSegmentWithTitle:@"已删除" atIndex:2 animated:NO];
    
    // 在指定序号处移除一个分段，会自动布局
//    [self.segmentedControl removeSegmentAtIndex:2 animated:NO];
    
    // 设置指定序号处的分段的宽度
//    [self.segmentedControl setWidth:50.0 forSegmentAtIndex:1];
    
    // 获取指定序号处标题的内容
//    NSLog(@"%@", [self.segmentedControl titleForSegmentAtIndex:1]);
    
    // 获取指定序号处标题的宽度
//    NSLog(@"%f", [self.segmentedControl widthForSegmentAtIndex:1]);
    
    // 设置指定序号处的分段不可选
//    [self.segmentedControl setEnabled:NO forSegmentAtIndex:1];
    
    [self.view addSubview:self.segmentedControl];
    
}

- (void)selectItem:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        NSLog(@"正在销售");
    } else {
        NSLog(@"已下架");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
