//
//  EMCategoryInfo.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMCategoryInfo.h"
#import <UIKit/UIKit.h>

@implementation EMCategoryInfo

-(id)initWith:(NSDictionary *)dic
{
    if (!dic || ![dic isKindOfClass:[NSDictionary class]]) {return  nil;}
    self = [super init];
    if (!self){ return  nil;}
    startParser(dic, self, EMCategoryInfo)
    parserObjAttr(name)
    parserObjAttr(contentType)
    parserObjAttr(title)
    
    parserBaseAttr(filterSupported, boolValue)
    parserBaseAttr(categoryType, integerValue)
    parserBaseAttr(moduleType, integerValue)
    
    return self;
}


//static UILabel *cellHeightLabel;
//
//- (CGFloat)cellHeight
//{
//    if (cellHeightLabel == nil) {
//        cellHeightLabel = [[UILabel alloc]init];
//        cellHeightLabel.backgroundColor = [UIColor redColor];
//        cellHeightLabel.numberOfLines = 0;
//        cellHeightLabel.text = self.message; // 已经赋值的文本
//        cellHeightLabel.lineBreakMode = NSLineBreakByWordWrapping;
//        cellHeightLabel.textAlignment = NSTextAlignmentLeft;
//        cellHeightLabel.font = [UIFont systemFontOfSize:16];
//    }
//    CGSize labelSize = [cellHeightLabel sizeThatFits:CGSizeMake(200.f, MAXFLOAT)];
//    CGFloat height = ceil(labelSize.height) + 1;
//    
//    return height;
//}

@end
