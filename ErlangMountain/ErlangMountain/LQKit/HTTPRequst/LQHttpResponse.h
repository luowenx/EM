//
//  LQHttpResponse.h
//  MVVMDemo
//
//  Created by lequwuxian1 on 2018/4/4.
//  Copyright © 2018年 lequwuxian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LQProtocolDef.h"

/**
 网络数据解析基类
 */
@interface LQHttpResponse : NSObject<LQDecode>

/**
 回调状态 ，0表示成功
 */
@property (nonatomic) NSInteger  ret;
/**
 提示
 */
@property (nonatomic, copy) NSString *msg;

/**
 * 数据字典，子类对data进行解析
 * 也可能是数组
 */
@property (nonatomic) id data;

@end
