//
//  CLFootView.m
//  ShoppingSample
//
//  Created by LongCh on 2017/10/13.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLFootView.h"

@interface CLFootView ()
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UIButton *loadMoreBtn;
- (IBAction)loadMoreClick:(id)sender;

@end

@implementation CLFootView

- (IBAction)loadMoreClick:(id)sender {
    //隐藏 加载更多按钮
    self.loadMoreBtn.hidden = YES;
    //显示 正在加载
    self.loadingView.hidden = NO;
    
    //一秒钟后执行里面代码
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //调用协议中的代理方法
        if([self.delegate respondsToSelector:@selector(footViewloadingModel:)]){
            [self.delegate footViewloadingModel:self];
        }
        //显示 加载更多按钮
        self.loadMoreBtn.hidden = NO;
        //隐藏 正在加载
        self.loadingView.hidden = YES;
        
    });
    
    

}
@end
