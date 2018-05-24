//
//  EMRecommendListReq.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/19.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRecommendListReq.h"

@implementation EMRecommendListReq

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.relativeUrl = @"/mobile/discovery/v1/recommends?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&scale=2&version=4.3.26";
        self.isNeedCache = YES;
    }
    return self;
}

-(LQHttpResponse *)httpResponseParserData:(id)aData
{
    if (!aData || ![aData isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    EMRecommendListRes *res = [[EMRecommendListRes alloc] init];
    startParser(aData, res, EMRecommendListRes)
    parserObjAttr(focusImages)
    parserObjAttr(hotRecommends)

    return res;
}


@end

@implementation EMRecommendListRes

@end
