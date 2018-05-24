//
//  EMAlbumDetailReq.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAlbumDetailReq.h"

@implementation EMAlbumDetailReq

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.relativeUrl = @"/mobile/others/ca/album/track";
    }
    return self;
}

-(LQHttpResponse *)httpResponseParserData:(id)aData
{
    if (!aData || ![aData isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    EMAlbumDetailRes *res = [[EMAlbumDetailRes alloc] init];
    startParser(aData, res, EMAlbumDetailRes)
    parserObjAttr(album)
    
    if (lqpIsJsonElementValid(aData, @"tracks", NULL)) {
        NSDictionary *dic = aData[@"tracks"];
        inobj.maxPageId = [dic[@"maxPageId"] integerValue];
        inobj.list = dic[@"list"];
        inobj.pageId = [dic[@"pageId"] integerValue];
        inobj.pageSize = [dic[@"pageSize"] integerValue];
        inobj.totalCount = [dic[@"totalCount"] integerValue];
    }
    
    return res;
}

@end

@implementation EMAlbumDetailRes
@end
