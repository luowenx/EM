//
//  EMPlayAudioReq.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/3.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPlayAudioReq.h"

@implementation EMPlayAudioReq

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.relativeUrl = @"/v1/track/baseInfo?device=iphone";
    }
    return self;
}

-(void)buildRequestParameterWithDictionary:(NSMutableDictionary *)aParameters
{
    __setObjAttr(aParameters, trackId)
}

-(LQHttpResponse *)httpResponseParserData:(id)aData
{
    if (!aData || ![aData isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    EMPlayAudioRes *res = [[EMPlayAudioRes alloc] init];
    res.data = aData;
    return res;
}

@end

@implementation EMPlayAudioRes
@end

