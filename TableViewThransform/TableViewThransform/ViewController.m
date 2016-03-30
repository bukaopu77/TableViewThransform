//
//  ViewController.m
//  tableViewTransform
//
//  Created by 周剑 on 15/12/19.
//  Copyright © 2015年 bukaopu. All rights reserved.
//


#define k_screenWidth [UIScreen mainScreen].bounds.size.width
#define k_screenHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "XQCustomCell.h"


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *mainTableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, k_screenWidth, k_screenHeight) style:UITableViewStylePlain];
    // 记录中心点
    CGPoint pointCenter = self.mainTableView.center;
    self.mainTableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
    self.mainTableView.frame = CGRectMake(0, 0, k_screenWidth, k_screenHeight);
    self.mainTableView.center = pointCenter;
    [self.view addSubview:self.mainTableView];
    
    // 设置代理
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    // 滚动
    self.mainTableView.contentOffset = CGPointMake(k_screenWidth, 0);
    self.mainTableView.pagingEnabled = YES;
    
    // 注册cell
    [self.mainTableView registerNib:[UINib nibWithNibName:@"XQCustomCell" bundle:nil] forCellReuseIdentifier:@"XQCustomCell"];
}
#pragma mark - cell数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}
#pragma mark - 设置cell内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XQCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XQCustomCell"];
    // 旋转cell
    cell.transform = CGAffineTransformMakeRotation(M_PI_2);
    return cell;
}
#pragma mark - cell高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return k_screenWidth;
}

@end
