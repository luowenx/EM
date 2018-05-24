//
//  EMViewModel.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/13.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 数据模型、视图处理类
 */
@interface EMViewModel : NSObject {
@protected
    NSInteger page_;
}

@property (nonatomic) NSInteger page;

/** kEMHeaderCommandStatus  */
@property (nonatomic, strong) RACCommand *headerStatusCommand;
/** kEMFooterCommandStatus  */
@property (nonatomic, strong) RACCommand *footerStatusCommand;
/** LQHttpError  */
@property (nonatomic, strong) RACCommand *errorCommand;

/**
 获取数据
 */
-(void)fetchData;

/**
 获取下一页数据
 */
-(void)loadMoreData;

@end
