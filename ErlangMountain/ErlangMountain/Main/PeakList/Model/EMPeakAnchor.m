//
//  EMPeakAnchor.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPeakAnchor.h"

@implementation EMPeakAnchor

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    self = [super initWith:dic];
    if (self) {
        startParser(dic, self, EMPeakAnchor)
        parserObjAttr(verifyTitle)
        parserObjAttr(largeLogo)
        parserObjAttr(middleLogo)
        parserObjAttr(userGrade)
        parserObjAttr(personDescribe)
        parserObjAttr(verifyType)
        
        parserBaseAttr(tracksCounts, integerValue)
        parserBaseAttr(anchorGrade, integerValue)
        parserBaseAttr(followersCounts, integerValue)
    }
    return self;
}

-(NSDictionary *)toJSON
{
    NSMutableDictionary *aParameters = [super toJSON].mutableCopy;;
    __setObjAttr(aParameters, verifyTitle)
    __setObjAttr(aParameters, largeLogo)
    __setObjAttr(aParameters, middleLogo)
    __setObjAttr(aParameters, userGrade)
    __setObjAttr(aParameters, personDescribe)
    __setObjAttr(aParameters, verifyType)
    
    __setBaseAttrInsist(aParameters, tracksCounts)
    __setBaseAttrInsist(aParameters, anchorGrade)
    __setBaseAttrInsist(aParameters, followersCounts)
    return aParameters.copy;
}

@end
