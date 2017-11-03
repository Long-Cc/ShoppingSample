//
//  CLFoodTableViewCell.h
//  ShoppingSample
//
//  Created by LongCh on 2017/10/12.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLfood.h"

@interface CLFoodTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *pricLable;
@property (weak, nonatomic) IBOutlet UILabel *buyCoutLabel;

+ (instancetype)foodCellWithTableView:(UITableView *)tableView;

@property (nonatomic,copy) CLfood *food;
@end
