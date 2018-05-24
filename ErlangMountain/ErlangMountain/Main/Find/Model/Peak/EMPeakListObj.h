//
//  EMPeakListObj.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 榜单对象
 */
@class EMKResult;
@interface EMPeakListObj : NSObject<LQDecode, LQDataTransformation>
@property (nonatomic) NSInteger totalCount;
@property (nonatomic) NSInteger firstId;
@property (nonatomic) NSInteger pageSize;
@property (nonatomic) NSInteger top;
@property (nonatomic) NSInteger period;
@property (nonatomic) NSInteger orderNum;
@property (nonatomic) NSInteger pageId;
@property (nonatomic) NSInteger maxPageId;
@property (nonatomic) NSInteger rankingListId;
@property (nonatomic) NSInteger ret;
@property (nonatomic) NSInteger categoryId;
@property (nonatomic) BOOL isAllPaid;

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * rankingRule;
@property (nonatomic, copy) NSString * calcPeriod;
@property (nonatomic, copy) NSString * coverPath;
@property (nonatomic, copy) NSString * subtitle;
@property (nonatomic, copy) NSString * contentType;
@property (nonatomic, copy) NSString * firstTitle;
@property (nonatomic, copy) NSString * key;

@property (nonatomic, strong) NSArray <EMKResult *> * firstKResults;
@property (nonatomic, strong) NSArray *list;

@end

/*
 [0]    (null)    @"totalCount" : (long)0
 [1]    (null)    @"firstId" : (long)12580785
 [2]    (null)    @"pageSize" : (long)1
 [3]    (null)    @"title" : @"优质专辑榜"
 [4]    (null)    @"firstKResults" : @"2 elements"
 [5]    (null)    @"top" : (long)100
 [6]    (null)    @"period" : (long)7
 [7]    (null)    @"rankingRule" : @"score"
 [8]    (null)    @"calcPeriod" : @"周榜"
 [9]    (null)    @"orderNum" : (long)0
 [10]    (null)    @"pageId" : (long)0
 [11]    (null)    @"maxPageId" : (long)0
 [12]    (null)    @"rankingListId" : (long)63
 [13]    (null)    @"list" : @"0 elements"
 [14]    (null)    @"coverPath" : @"http://fdfs.xmcdn.com/group11/M09/85/22/wKgDa1dhNrDB9CLKAABWkqxY2as014.jpg"
 [15]    (null)    @"subtitle" : @"最多人听的专辑TOP100"
 [16]    (null)    @"contentType" : @"album"
 [17]    (null)    @"isAllPaid" : (no summary)
 [18]    (null)    @"ret" : (long)0
 [19]    (null)    @"firstTitle" : @"鲜快报"
 [20]    (null)    @"categoryId" : (long)0
 [21]    (null)    @"key" : @"1_63_ranking:album:score:7:0"    
 */
