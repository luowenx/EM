//
//  NSObject+runtime.m
//  足彩大赢家
//
//  Created by lequwuxian1 on 2018/3/5.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import "NSObject+runtime.h"
#import <objc/runtime.h>

@implementation NSObject (runtime)


-(NSArray *)propertyList
{
    unsigned int count;
    objc_property_t *propertys = class_copyPropertyList([self class], &count);
    
    NSMutableArray *propertyList_ = [NSMutableArray arrayWithCapacity:count];

    for (unsigned int i = 0; i<count; i++) {
        const char *propertyName = property_getName(propertys[i]);
        [propertyList_ addObject:[NSString stringWithUTF8String:propertyName]];
    }
    
    free(propertys);
    return propertyList_.copy;
}


#pragma mark ==== getter & setter


@end
