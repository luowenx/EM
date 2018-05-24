//
//  EMFocuseImage.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/19.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMFocuseImage.h"

@implementation EMFocuseImage

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) { return nil; }
    self =[super init];
    if (!self) { return nil; }
    
    startParser(dic, self, EMFocuseImage)
    parserObjAttr(url)
    parserObjAttr(shortTitle)
    parserObjAttr(longTitle)
    parserObjAttr(pic)
    parserBaseAttr(type, integerValue)
    parserBaseAttr(isShare, boolValue)
    parserBaseAttr(is_External_url, boolValue)
    
    parserBaseAttr(id, integerValue)
    parserBaseAttr(roomId, integerValue)
    parserObjAttr(focusCurrentId)
    parserBaseAttr(specialId, integerValue)
    parserBaseAttr(subType, integerValue)
    
    return self;
}

LQDataTransformationImplementation

@end
