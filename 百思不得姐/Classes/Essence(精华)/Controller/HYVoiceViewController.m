//
//  HYVoiceViewController.m
//  百思不得姐
//
//  Created by 李好一 on 16/2/28.
//  Copyright © 2016年 李好一. All rights reserved.
//

#import "HYVoiceViewController.h"

@implementation HYVoiceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(HYTitlesViewH, 0, HYTabBarH, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %zd", self.class, indexPath.row];
    
    return cell;
}

@end
