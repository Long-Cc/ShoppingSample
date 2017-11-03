//
//  CLFoodTableViewCell.m
//  ShoppingSample
//
//  Created by LongCh on 2017/10/12.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLFoodTableViewCell.h"

@implementation CLFoodTableViewCell

- (void)setFood:(CLfood *)food{
    self.imageView.image = [UIImage imageNamed:food.icon];
    self.titleLabel.text = food.title;
    self.pricLable.text = [NSString stringWithFormat:@"¥ %@",food.price];
    self.buyCoutLabel.text = [NSString stringWithFormat:@"已售出 %@",food.buyCout];
}

+ (instancetype)foodCellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"food_cell";
    CLFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CLFoodTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
