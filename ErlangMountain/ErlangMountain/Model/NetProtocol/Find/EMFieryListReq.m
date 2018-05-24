//
//  EMFieryListReq.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMFieryListReq.h"

@implementation EMFieryListReq

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.relativeUrl = @"/m/explore_user_index?device=iPhone";
        self.isNeedCache = YES;
    }
    return self;
}

- (void)buildRequestParameterWithDictionary:(NSMutableDictionary *)aParameters
{
    __setBaseAttrInsist(aParameters, page)
}

-(LQHttpResponse *)httpResponseParserData:(id)aData
{
    if (!aData || ![aData isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    EMFieryListRes *res = [[EMFieryListRes alloc] init];
    startParser(aData, res, EMFieryListRes)
    parserObjAttr(list)
    parserBaseAttr(maxPageId, integerValue)
    
    return res;
}

@end

@implementation EMFieryListRes

@end
