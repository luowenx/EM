//
//  EMRecommendSubViewModel.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRecommendSubViewModel.h"
#import "EMRecommendPageSubReq.h"
#import "EMBookBaseInfo.h"

@interface EMRecommendSubViewModel ()

@property (nonatomic, strong) EMBookBaseInfo *bookInfo;

@property (nonatomic, strong, readwrite) NSMutableArray<EMBookDetailInfo *> * dataArray;

@end

@implementation EMRecommendSubViewModel

- (instancetype)initWithBookInfo:(EMBookBaseInfo *)bookInfo
{
    self = [super init];
    if (self) {
        _bookInfo = bookInfo;
        _dataArray  =[NSMutableArray array];
        [self fetchData];
    }
    return self;
}

-(void)fetchData
{
    page_ = 1;
    EMRecommendPageSubReq *req = [[EMRecommendPageSubReq alloc] init];
    req.pageId = page_;
    req.categoryId = self.bookInfo.category_id;
    req.tagName = self.bookInfo.tname;
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMRecommendPageSubRes *res = (EMRecommendPageSubRes *)response;
        [self.dataArray removeAllObjects];
        [self willChangeValueForKey:@"dataArray"];
        [self.dataArray addObjectsFromArray:[EMBookDetailInfo objArrayWithDics:res.list]];
        [self didChangeValueForKey:@"dataArray"];
        
        if (self.page >= res.maxPageId) {
            [self.footerStatusCommand execute:@(kEMFooterStatusNoMoreData)];
        }else{
            [self.footerStatusCommand execute:@(kEMFooterStatusReSet)];
        }
        
        [self.headerStatusCommand execute:@(kEMHeaderStatusEndRefresh)];
    } error:^(LQHttpError *error) {
        
        [self.footerStatusCommand execute:@(kEMFooterStatusEndRefresh)];
        [self.errorCommand execute:error];
    }];
    
}

-(void)loadMoreData
{
    page_++;
    EMRecommendPageSubReq *req = [[EMRecommendPageSubReq alloc] init];
    req.pageId = page_;
    req.categoryId = self.bookInfo.category_id;
    req.tagName = self.bookInfo.tname;
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMRecommendPageSubRes *res = (EMRecommendPageSubRes *)response;
        [self willChangeValueForKey:@"dataArray"];
        [self.dataArray addObjectsFromArray:[EMBookDetailInfo objArrayWithDics:res.list]];
        [self didChangeValueForKey:@"dataArray"];
        
        if (self.page >= res.maxPageId) {
            [self.footerStatusCommand execute:@(kEMFooterStatusNoMoreData)];
        }else{
            [self.footerStatusCommand execute:@(kEMFooterStatusReSet)];
        }
    } error:^(LQHttpError *error) {
        
        [self.footerStatusCommand execute:@(kEMFooterStatusEndRefresh)];
        [self.errorCommand execute:error];
    }];
}

@end
