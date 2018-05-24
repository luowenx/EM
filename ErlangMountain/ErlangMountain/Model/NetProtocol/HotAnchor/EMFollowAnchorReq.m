//
//  EMFollowAnchorReq.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/8.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMFollowAnchorReq.h"

@implementation EMFollowAnchorReq

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.relativeUrl = @"/mobile/others/ca/homePage?device=iPhone";
    }
    return self;
}

-(void)buildRequestParameterWithDictionary:(NSMutableDictionary *)aParameters
{
__setBaseAttrInsist(aParameters, toUid)
}

-(LQHttpResponse *)httpResponseParserData:(id)aData
{
    if (!aData || ![aData isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    EMFollowAnchorRes *res = [[EMFollowAnchorRes alloc] init];
    
    res.data = aData;
    
    return res;
}

@end

@implementation EMFollowAnchorRes
@end
