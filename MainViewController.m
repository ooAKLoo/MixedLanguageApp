//
//  MainViewController.m
//  MixedLanguageApp
//
//  Created by 杨东举 on 2025/3/13.
//

// MainViewController.m
#import "MainViewController.h"
#import "MixedLanguageApp-Swift.h" // 引入Swift文件的桥接头文件

@interface MainViewController ()

@property (nonatomic, strong) UIButton *navigateButton;
@property (nonatomic, strong) UIButton *multiLabelButton;
@property (nonatomic, strong) DetailViewController *detailVC;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 初始化状态消息
    self.statusMessage = @"初始状态消息";
    
    // 创建第一个按钮
    self.navigateButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.navigateButton setTitle:@"跳转到Swift页面" forState:UIControlStateNormal];
    [self.navigateButton addTarget:self action:@selector(navigateToDetailView) forControlEvents:UIControlEventTouchUpInside];
    self.navigateButton.frame = CGRectMake(100, 150, 200, 50);
    [self.view addSubview:self.navigateButton];
    
    // 创建第二个按钮
    self.multiLabelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.multiLabelButton setTitle:@"跳转到多Label页面" forState:UIControlStateNormal];
    [self.multiLabelButton addTarget:self action:@selector(navigateToMultiLabelView) forControlEvents:UIControlEventTouchUpInside];
    self.multiLabelButton.frame = CGRectMake(100, 250, 200, 50);
    [self.view addSubview:self.multiLabelButton];
    
    // 启动状态更新定时器
    [self startStatusUpdateTimer];
}

- (void)startStatusUpdateTimer {
    // 每3秒更新一次状态
    self.statusUpdateTimer = [NSTimer scheduledTimerWithTimeInterval:3.0
                                                             target:self
                                                           selector:@selector(updateStatus)
                                                           userInfo:nil
                                                            repeats:YES];
}

- (void)updateStatus {
    // 更新状态消息
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    self.statusMessage = [NSString stringWithFormat:@"状态更新时间: %@", [formatter stringFromDate:currentDate]];
    
    // 如果详情页面已经加载，则更新它的状态消息
    if (self.detailVC) {
        [self.detailVC updateMessageWithText:self.statusMessage];
    }
}

- (void)navigateToDetailView {
    // 创建并配置详情页面
    self.detailVC = [[DetailViewController alloc] init];
    [self.detailVC updateMessageWithText:self.statusMessage];
    
    // 跳转到详情页面
    [self.navigationController pushViewController:self.detailVC animated:YES];
}

- (void)navigateToMultiLabelView {
    // 创建MultiLabelViewController并设置ContentType
    // 这里我们选择随机的ContentType (1-3)
    NSInteger contentType = (arc4random() % 3) + 1;
    
    // 使用Swift类
    MultiLabelViewController *multiLabelVC = [[MultiLabelViewController alloc] initWithContentType:contentType];
    [self.navigationController pushViewController:multiLabelVC animated:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // 如果页面消失且导航回退，则清除详情页面引用
    if (![self.navigationController.viewControllers containsObject:self]) {
        self.detailVC = nil;
    }
}

- (void)dealloc {
    // 销毁定时器
    [self.statusUpdateTimer invalidate];
    self.statusUpdateTimer = nil;
}

@end
