//
//  EMPeakGroupObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPeakGroupObj.h"
#import "EMPeakListObj.h"

@implementation EMPeakGroupObj

LQDataTransformationImplementation

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) { return nil; }
    self = [super init];
    if (!self) { return nil; }
    startParser(dic, self, EMPeakGroupObj)
    parserBaseAttr(count, integerValue)
    parserObjAttr(title)
    
    if (lqpIsJsonElementValid(intdic, @"list", NULL)) {
        inobj.list = [EMPeakListObj objArrayWithDics:intdic[@"list"]];
    }
    
    return self;
}

@end
