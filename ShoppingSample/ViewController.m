//
//  ViewController.m
//  ShoppingSample
//
//  Created by LongCh on 2017/10/12.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "ViewController.h"
#import "CLfood.h"
#import "CLFoodTableViewCell.h"
#import "CLFootView.h"

@interface ViewController () <UITableViewDataSource,CLFootViewDelegate>
@property (nonatomic,strong) NSMutableArray *foods;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

//懒加载
- (NSMutableArray *)foods{
    if(_foods == nil){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"foods_list.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayFood = [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            CLfood *food = [CLfood foodWithDict:dict];
            [arrayFood addObject:food];
        }
        _foods = arrayFood;
    }
    return _foods;
}


# pragma mark UITableViewDataSource method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.foods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CLfood *food = self.foods[indexPath.row];
   // static NSString *ID = @"food_cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if(!cell){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    }
//    cell.imageView.image = [UIImage imageNamed:food.icon];
//    cell.textLabel.text = food.title;
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"¥ %@       已售出 %@",food.price,food.buyCout];
//    CLFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if(!cell){
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"CLFoodTableViewCell" owner:nil options:nil] lastObject];
//    }
//    CLFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    CLFoodTableViewCell *cell = [CLFoodTableViewCell foodCellWithTableView:tableView];
    if(!cell){
         cell = [[[NSBundle mainBundle] loadNibNamed:@"CLFoodTableViewCell" owner:nil options:nil] lastObject];
    }
    cell.food =food;
    
    return cell;
}

- (BOOL) prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 80;
//    CGRect rect = CGRectMake(0, 0, 0, 30);//X轴坐标与高设置有效
//    UIView *footView = [[UIView alloc] initWithFrame:rect];
//    footView.backgroundColor = [UIColor orangeColor];
//    self.tableView.tableFooterView = footView;
    CLFootView *footView = [[[NSBundle mainBundle] loadNibNamed:@"CLFootView" owner:nil options:nil] lastObject];
    self.tableView.tableFooterView = footView;
    footView.delegate =self;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)footViewloadingModel:(CLFootView *)footView {
    CLfood *food = [[CLfood alloc] init];
    food.title = @"好吃懒做，买不起！";
    food.icon = @"06";
    food.price = @"65";
    food.buyCout = @"100";
    [self.foods addObject:food];
    [self.tableView reloadData];
    
    //滚动到最上面
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.foods.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

@end
