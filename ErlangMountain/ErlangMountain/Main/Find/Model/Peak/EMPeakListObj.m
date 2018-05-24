//
//  EMPeakListObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPeakListObj.h"
#import "EMKResult.h"

@implementation EMPeakListObj

LQDataTransformationImplementation

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) { return nil; }
    self = [super init];
    if (!self) { return nil; }
    startParser(dic, self, EMPeakListObj)
    parserBaseAttr(totalCount, integerValue)
    parserBaseAttr(firstId, integerValue)
    parserBaseAttr(pageSize, integerValue)
    parserBaseAttr(top, integerValue)
    parserBaseAttr(period, integerValue)
    parserBaseAttr(orderNum, integerValue)
    parserBaseAttr(pageId, integerValue)
    parserBaseAttr(maxPageId, integerValue)
    parserBaseAttr(rankingListId, integerValue)
    parserBaseAttr(isAllPaid, boolValue)
    parserBaseAttr(ret, boolValue)
    parserBaseAttr(categoryId, integerValue)
    
    parserObjAttr(title)
    parserObjAttr(rankingRule)
    parserObjAttr(calcPeriod)
    parserObjAttr(coverPath)
    parserObjAttr(subtitle)
    parserObjAttr(contentType)
    parserObjAttr(firstTitle)
    parserObjAttr(key)
    
    if (lqpIsJsonElementValid(intdic, @"firstKResults", NULL)) {
        inobj.firstKResults = [EMKResult objArrayWithDics:intdic[@"firstKResults"]];
    }
    
    if (lqpIsJsonElementValid(intdic, @"list", NULL)) {
        
    }
    
    return self;
}

@end
