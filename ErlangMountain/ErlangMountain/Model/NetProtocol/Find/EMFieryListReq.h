//
//  EMFieryListReq.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "LQHttpRequest.h"

@interface EMFieryListReq : LQHttpRequest

@property (nonatomic) NSInteger page;

@end

@interface EMFieryListRes : LQHttpResponse

@property (nonatomic) NSInteger maxPageId;

@property (nonatomic, strong) NSArray * list;

@end
