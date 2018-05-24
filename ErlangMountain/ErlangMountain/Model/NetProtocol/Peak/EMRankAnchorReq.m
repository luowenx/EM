//
//  EMRankAnchorReq.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRankAnchorReq.h"

@implementation EMRankAnchorReq

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.relativeUrl = @"/mobile/discovery/v1/rankingList/anchor?device=iPhone";
    }
    return self;
}


-(void)buildRequestParameterWithDictionary:(NSMutableDictionary *)aParameters
{
    __setObjAttr(aParameters, key)
    __setBaseAttrInsist(aParameters, pageSize)
    __setBaseAttrInsist(aParameters, pageId)
}

-(LQHttpResponse *)httpResponseParserData:(id)aData
{
    if (!aData || ![aData isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    EMRankAnchorRes *res = [[EMRankAnchorRes alloc] init];
    startParser(aData, res, EMRankAnchorRes)
    parserBaseAttr(pageId, integerValue)
    parserBaseAttr(pageSize, integerValue)
    parserBaseAttr(totalCount, integerValue)
    parserBaseAttr(maxPageId, integerValue)
    parserObjAttr(list)
    
    return res;
}

@end

@implementation EMRankAnchorRes

@end
