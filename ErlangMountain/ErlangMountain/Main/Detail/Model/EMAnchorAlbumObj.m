//
//  EMAnchorAlbumObj.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/10.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAnchorAlbumObj.h"

@implementation EMAnchorAlbumObj

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) {return  nil;}
    self = [super initWith:dic];
    if (!self){ return  nil;}
    startParser(dic, self, EMAnchorAlbumObj)
    parserBaseAttr(is_default, boolValue)
    parserBaseAttr(isDefault, boolValue)
    parserBaseAttr(isOpenGiftSwitch, boolValue)
    parserBaseAttr(isFromAudioPlus, boolValue)
    parserBaseAttr(isPublic, boolValue)
    parserBaseAttr(isLastUpdated, boolValue)

    parserBaseAttr(status, integerValue)
    parserBaseAttr(qualityScoreUpdatedAt, integerValue)
    parserBaseAttr(qualityScore, integerValue)
    parserBaseAttr(unReadAlbumCommentCount, integerValue)
    parserBaseAttr(serializeStatus, integerValue)
    parserBaseAttr(playTimes, integerValue)
    parserBaseAttr(shares, integerValue)

    parserBaseAttr(updatedAt, longLongValue)

    return self;
}

@end
