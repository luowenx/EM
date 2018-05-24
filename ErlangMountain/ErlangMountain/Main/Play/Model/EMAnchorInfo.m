//
//  EMAnchorInfo.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/3.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAnchorInfo.h"

@implementation EMAnchorInfo

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) {return  nil;}
    self = [super initWith:dic];
    if (!self) {return nil;}
    startParser(dic, self, EMAnchorInfo)
    parserObjAttr(personalSignature)
    parserObjAttr(personDescribe)
    parserObjAttr(ptitle)
    
    parserBaseAttr(verifyType, integerValue)
    parserBaseAttr(tracks, integerValue)
    parserBaseAttr(anchorGrade, integerValue)
    parserBaseAttr(albums, integerValue)
    parserBaseAttr(followings, integerValue)
    parserBaseAttr(followers, integerValue)
    parserBaseAttr(isVip, boolValue)

    return self;
}

-(NSDictionary *)toJSON
{
    NSMutableDictionary *aParameters = [super toJSON].mutableCopy;
    __setObjAttr(aParameters, personalSignature)
    __setObjAttr(aParameters, personDescribe)
    __setObjAttr(aParameters, ptitle)
    
    __setBaseAttrInsist(aParameters, verifyType)
    __setBaseAttrInsist(aParameters, tracks)
    __setBaseAttrInsist(aParameters, anchorGrade)
    __setBaseAttrInsist(aParameters, albums)
    __setBaseAttrInsist(aParameters, followings)
    __setBaseAttrInsist(aParameters, followers)
    __setBaseAttrInsist(aParameters, isVip)
    return aParameters.copy;
}

@end
