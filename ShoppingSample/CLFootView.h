//
//  CLFootView.h
//  ShoppingSample
//
//  Created by LongCh on 2017/10/13.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CLFootView;

@protocol CLFootViewDelegate <NSObject>

@required
- (void)footViewloadingModel:(CLFootView *)footView;
@end

@interface CLFootView : UIView
@property (nonatomic, weak) id<CLFootViewDelegate> delegate;

@end
