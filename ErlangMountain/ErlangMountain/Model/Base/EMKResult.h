//
//  EMKResult.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 类型基类
 */
@interface EMKResult : NSObject<LQDecode, LQEncode, LQDataTransformation>
@property (nonatomic) NSInteger id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *contentType;

@end

/*
 [0]    (null)    @"id" : (long)7651313
 [1]    (null)    @"title" : @"晓说2018"
 [2]    (null)    @"contentType" : @"album"
 */
