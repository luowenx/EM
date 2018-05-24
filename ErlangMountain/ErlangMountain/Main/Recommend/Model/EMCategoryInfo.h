//
//  EMCategoryInfo.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 分类信息
 */
@interface EMCategoryInfo : NSObject<LQDecode>
@property (nonatomic, copy) NSString * contentType;
@property (nonatomic) BOOL filterSupported;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * name;
@property (nonatomic) NSInteger categoryType;
@property (nonatomic) NSInteger moduleType;

@end

/*
 [0]    (null)    @"contentType" : @"album"
 [1]    (null)    @"filterSupported" : (no summary)
 [2]    (null)    @"title" : @"有声书"
 [3]    (null)    @"name" : @"book"
 [4]    (null)    @"categoryType" : (long)0
 [5]    (null)    @"moduleType" : (long)7
 */
