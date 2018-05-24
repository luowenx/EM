//
//  EMBookBaseInfo.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EMBookBaseInfo : NSObject<LQDecode, LQEncode, LQDataTransformation>

@property (nonatomic, copy) NSString * tname;

@property (nonatomic) NSInteger category_id;

@end

/*
 [0]    (null)    @"tname" : @"言情"
 [1]    (null)    @"category_id" : (long)3
 */
