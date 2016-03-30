//
//  XQCustomCell.m
//  tableViewTransform
//
//  Created by 周剑 on 15/12/19.
//  Copyright © 2015年 bukaopu. All rights reserved.
//

#define k_screenWidth [UIScreen mainScreen].bounds.size.width
#define k_screenHeight [UIScreen mainScreen].bounds.size.height

#import "XQCustomCell.h"


@interface XQCustomCell ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *mainTableView;


@end

@implementation XQCustomCell

// 必须用方法设置frame
- (void)setFrame:(CGRect)frame {
    frame.size.width = k_screenHeight;
    [super setFrame:frame];
}

- (void)awakeFromNib {
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;

    self.mainTableView.frame = CGRectMake(0, 0, k_screenWidth, k_screenHeight);
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cell_id = @"flag";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    cell.textLabel.text = @"d";
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
