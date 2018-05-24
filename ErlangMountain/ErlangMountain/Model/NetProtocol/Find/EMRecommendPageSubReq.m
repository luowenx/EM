//
//  EMRecommendPageSubReq.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRecommendPageSubReq.h"

@implementation EMRecommendPageSubReq

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.relativeUrl = @"/mobile/discovery/v1/category/album?calcDimension=hot&device=iPhone&pageSize=20&status=0";
    }
    return self;
}

-(void)buildRequestParameterWithDictionary:(NSMutableDictionary *)aParameters
{
    __setObjAttr(aParameters, tagName)
    __setBaseAttrInsist(aParameters, categoryId)
    __setBaseAttrInsist(aParameters, pageId)
}

-(LQHttpResponse *)httpResponseParserData:(id)aData
{
    if (!aData || ![aData isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    EMRecommendPageSubRes *res = [[EMRecommendPageSubRes alloc] init];
    startParser(aData, res, EMRecommendPageSubRes)
    parserObjAttr(list)
    parserObjAttr(subfields)
    parserObjAttr(title)
    parserBaseAttr(pageId, integerValue)
    parserBaseAttr(pageSize, integerValue)
    parserBaseAttr(totalCount, integerValue)
    parserBaseAttr(maxPageId, integerValue)
    
    return res;
}

@end

@implementation EMRecommendPageSubRes

@end
