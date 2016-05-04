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
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"正在销售", @"已下架"]];
    self.segmentedControl.frame = CGRectMake(-5, 50, SCREENWIDTH+10, 30);
    self.segmentedControl.tintColor = cmGreen;
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:cmGreen,NSForegroundColorAttributeName,[UIFont systemFontOfSize:18],NSFontAttributeName ,nil];
    [self.segmentedControl setTitleTextAttributes:dic forState:UIControlStateNormal];
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.segmentedControl addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventValueChanged];
    
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
