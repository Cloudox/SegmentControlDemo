# SegmentControlDemo
学习使用SegmentControl

我们经常使用的一个控件是Tab，这个控件可以帮助我们将App分为几个模块，但是在一个界面内我们想要再进行细分怎么办呢？这时候就需要用到UISegmentedControl控件了，这个控件的用处就是进行分段控制，实现的样式如下：

![](https://github.com/Cloudox/SegmentControlDemo/blob/master/screen.png)

当选中一个分段的时候，其颜色填充，其余分段为未选中状态，可以很清晰明了地告知用户当前在哪个分段内容下，也方便用户切换。

具体的实现方式，还是先看代码：

```objective-c
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
    self.segmentedControl.momentary = YES;
    
    // 在指定序号处插入一个分段，会自动布局
    [self.segmentedControl insertSegmentWithTitle:@"已删除" atIndex:2 animated:NO];
    
    // 在指定序号处移除一个分段，会自动布局
    [self.segmentedControl removeSegmentAtIndex:2 animated:NO];
    
    // 设置指定序号处的分段的宽度
    [self.segmentedControl setWidth:50.0 forSegmentAtIndex:1];
    
    // 获取指定序号处标题的内容
    NSLog(@"%@", [self.segmentedControl titleForSegmentAtIndex:1]);
    
    // 获取指定序号处标题的宽度
    NSLog(@"%f", [self.segmentedControl widthForSegmentAtIndex:1]);
    
    // 设置指定序号处的分段不可选
    [self.segmentedControl setEnabled:NO forSegmentAtIndex:1];
    
    [self.view addSubview:self.segmentedControl];
    
}

- (void)selectItem:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        NSLog(@"正在销售");
    } else {
        NSLog(@"已下架");
    }
}
```

注释已经都写的比较清楚了，有几个注意的地方特别提一下：

* UISegmentedControl的风格在iOS 7.0之后就不能设置了，相应的属性也进行了说明，即使设置了也是无效。
* 其实UISegmentedControl的样式时一个整体的圆角矩形，两边并不是像图中那样没有左右两边的，但是我觉得四个圆角不太好看，所以用了一个小技巧，将其起始的x坐标设为了-5，将其宽度设为了屏幕宽度+10，这样左右的圆角就隐藏起来了，看上去觉得要美观一些，我尝试过用layer来将角度调整为0，不起作用。
* 字体不能直接设置，只能像代码中一样创建一个字典来设置。
* 唤起响应方法的动作是UIControlEventValueChanged，是改变值的响应，而不是按钮那种TouchUpside。
* 分段的标题可以用文字（我这里都是文字）也可以用图片，基本都有对应的方法，可以在使用的时候根据代码补全提示去找。
* 初始化的时候如果没有设置初始的分段标题，而是用initWithFram来初始化的话，我尝试在后面用insertSegmentWithTitle来添加标题，不起作用。

这就是我的一点粗浅研究啦，可以关注[我的博客](http://blog.csdn.net/cloudox_)
