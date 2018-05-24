//
//  EMAnchorAlbumListReq.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/9.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAnchorAlbumListReq.h"

@implementation EMAnchorAlbumListReq

- (instancetype)init
{
    self = [super init];
    if (self) {
        //http://mobile.ximalaya.com/mobile/others/ca/album/%@/1/20?device=iPhone
        self.relativeUrl = @"/mobile/others/ca/album";
    }
    return self;
}

-(LQHttpResponse *)httpResponseParserData:(id)aData
{
    if (!aData || ![aData isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    EMAnchorAlbumListRes *res = [[EMAnchorAlbumListRes alloc] init];
    startParser(aData, res, EMAnchorAlbumListRes)
    parserBaseAttr(pageId, integerValue)
    parserBaseAttr(pageSize, integerValue)
    parserBaseAttr(totalCount, integerValue)
    parserBaseAttr(maxPageId, integerValue)
    parserObjAttr(list)
    
    return res;
}

@end

@implementation EMAnchorAlbumListRes

@end
