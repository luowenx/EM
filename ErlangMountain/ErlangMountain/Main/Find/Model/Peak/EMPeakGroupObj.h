//
//  EMPeakGroupObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 榜单分组对象
 */
@class EMPeakListObj;
@interface EMPeakGroupObj : NSObject<LQDecode, LQDataTransformation>

@property (nonatomic, copy) NSString *title;

@property (nonatomic) NSInteger count;

@property (nonatomic, strong) NSArray<EMPeakListObj *> *list;

@end


/*
 [0]    (null)    @"title" : @"主播榜单"
 [1]    (null)    @"count" : (long)5
 [2]    (null)    @"list" : @"5 elements"    
 */
