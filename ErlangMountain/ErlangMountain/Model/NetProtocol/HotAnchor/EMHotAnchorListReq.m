//
//  EMHotAnchorListReq.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/7.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMHotAnchorListReq.h"

@implementation EMHotAnchorListReq

- (instancetype)init
{
    self = [super init];
    if (self) {
        //http://mobile.ximalaya.com/m/explore_user_list?category_name=all&condition=hot&device=iPhone&page=1&per_page=20
        self.relativeUrl = @"/m/explore_user_list?device=iPhone";
        self.per_page = 20;
        self.condition = @"hot";
    }
    return self;
}

-(void)buildRequestParameterWithDictionary:(NSMutableDictionary *)aParameters
{
    __setObjAttr(aParameters, condition)
    __setObjAttr(aParameters, category_name)
    __setBaseAttrInsist(aParameters, per_page)
    __setBaseAttrInsist(aParameters, page)
}

-(LQHttpResponse *)httpResponseParserData:(id)aData
{
    if (!aData || ![aData isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    EMHotAnchorListRes *res = [[EMHotAnchorListRes alloc] init];
    startParser(aData, res, EMHotAnchorListRes)
    parserBaseAttr(pageId, integerValue)
    parserBaseAttr(pageSize, integerValue)
    parserBaseAttr(totalCount, integerValue)
    parserBaseAttr(maxPageId, integerValue)
    parserObjAttr(list)
    return res;
}

@end


@implementation EMHotAnchorListRes

@end
