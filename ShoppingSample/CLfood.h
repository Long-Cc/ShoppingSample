//
//  CLfood.h
//  ShoppingSample
//
//  Created by LongCh on 2017/10/12.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLfood : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *buyCout;
@property (nonatomic,copy) NSString *price;

- (instancetype)initWithDict:(NSDictionary *) dict;
+ (instancetype)foodWithDict:(NSDictionary *) dict;
@end
