//
//  EMFieryListObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMFieryListObj.h"
#import "EMAnchor.h"
#import "EMFollowsManager.h"

@implementation EMFieryListObj


LQDataTransformationImplementation

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) { return nil; }
    self =[super init];
    if (!self) { return nil; }
    startParser(dic, self, EMFieryListObj)
    parserObjAttr(title)
    parserObjAttr(name)
    parserBaseAttr(id, integerValue)
    
    if (lqpIsJsonElementValid(intdic, @"list", NULL)) {
        inobj.list = [EMAnchor objArrayWithDics:intdic[@"list"]];
        //  同步本地数据
        [inobj.list enumerateObjectsUsingBlock:^(EMAnchor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [EMFollows synchroObj:obj compareKey:@"uid" synchroKey:@"isFollowed"];
        }];
    }
    
    return self;
}

@end
