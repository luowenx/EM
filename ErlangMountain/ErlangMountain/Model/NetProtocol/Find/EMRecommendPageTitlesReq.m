//
//  EMRecommendPageTitlesReq.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRecommendPageTitlesReq.h"

@implementation EMRecommendPageTitlesReq

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.relativeUrl = @"/mobile/discovery/v1/category/tagsWithoutCover?device=iPhone&position=3";
    }
    return self;
}

-(void)buildRequestParameterWithDictionary:(NSMutableDictionary *)aParameters
{
    __setObjAttr(aParameters, contentType)
    __setBaseAttrInsist(aParameters, categoryId)
}

-(LQHttpResponse *)httpResponseParserData:(id)aData
{
    if (!aData || ![aData isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    EMRecommendPageTitlesRes *res = [[EMRecommendPageTitlesRes alloc] init];
    startParser(aData, res, EMRecommendPageTitlesRes)
    parserBaseAttr(hasRecommendedZones, boolValue)
    parserDiffBaseAttr(isFinished_, @"isFinished", boolValue)
    parserBaseAttr(count, integerValue)
    parserBaseAttr(maxPageId, integerValue)
    parserObjAttr(list)
    parserObjAttr(categoryInfo)
    
    return res;
}

@end

@implementation EMRecommendPageTitlesRes

@end
