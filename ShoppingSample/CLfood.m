//
//  CLfood.m
//  ShoppingSample
//
//  Created by LongCh on 2017/10/12.
//  Copyright © 2017年 LongCh. All rights reserved.
//

#import "CLfood.h"

@implementation CLfood

- (instancetype)initWithDict:(NSDictionary *) dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)foodWithDict:(NSDictionary *) dict{
    return [[self alloc] initWithDict:dict];
}
@end
