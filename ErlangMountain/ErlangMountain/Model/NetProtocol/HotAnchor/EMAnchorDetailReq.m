//
//  EMAnchorDetailReq.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/9.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAnchorDetailReq.h"

@implementation EMAnchorDetailReq

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
    EMAnchorDetailRes *res = [[EMAnchorDetailRes alloc] init];
    
    res.data = aData;
    
    return res;
}

@end

@implementation EMAnchorDetailRes
@end
