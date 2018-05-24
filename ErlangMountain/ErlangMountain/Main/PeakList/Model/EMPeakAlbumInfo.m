//
//  EMPeakAlbumInfo.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPeakAlbumInfo.h"

@implementation EMPeakAlbumInfo

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) {return nil;}
    self = [super initWith:dic];
    if (!self) {return nil;}
    startParser(dic, self, EMPeakAlbumInfo)
    parserBaseAttr(lastUptrackId, integerValue)
    parserBaseAttr(tracksCounts, integerValue)
    parserObjAttr(lastUptrackTitle)
    return self;
}

-(NSDictionary *)toJSON
{
    NSMutableDictionary *aParameters = [super toJSON].mutableCopy;
    __setBaseAttrInsist(aParameters, lastUptrackId)
    __setBaseAttrInsist(aParameters, tracksCounts)
    __setObjAttr(aParameters, lastUptrackTitle)
    return aParameters.copy;
}

@end
