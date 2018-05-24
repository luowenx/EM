//
//  EMPeakListReq.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/24.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPeakListReq.h"

@implementation EMPeakListReq
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.relativeUrl = @"/mobile/discovery/v2/rankingList/group?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&scale=2&version=4.3.26";
        self.isNeedCache = YES;
    }
    return self;
}


-(LQHttpResponse *)httpResponseParserData:(id)aData
{
    if (!aData || ![aData isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    EMPeakListRes *res = [[EMPeakListRes alloc] init];
    startParser(aData, res, EMPeakListRes)
    parserObjAttr(datas)
    parserObjAttr(focusImages)
    

    return res;
}


@end

@implementation EMPeakListRes
@end
