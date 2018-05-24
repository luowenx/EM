//
//  EMRecommendPageViewModel.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRecommendPageViewModel.h"
#import "EMRecommendPageTitlesReq.h"
#import "EMHotRecommendObj.h"
#import "EMBookBaseInfo.h"
#import "EMCategoryInfo.h"

@interface EMRecommendPageViewModel ()
// 上行
@property (nonatomic, strong) EMHotRecommendObj *hotRecommend;

// 下行
@property (nonatomic, strong, readwrite) NSArray <EMBookBaseInfo *>* categorys;
@property (nonatomic, strong) EMCategoryInfo *categoryInfo;

@end

@implementation EMRecommendPageViewModel

- (instancetype)initWithHotRecommend:(EMHotRecommendObj *)hotRecommend
{
    self = [super init];
    if (self) {
        _hotRecommend = hotRecommend;
        [self fetchData];
    }
    return self;
}

-(void)fetchData
{
    EMRecommendPageTitlesReq *req = [[EMRecommendPageTitlesReq alloc] init];
    req.contentType = self.hotRecommend.contentType;
    req.categoryId = self.hotRecommend.categoryId;
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMRecommendPageTitlesRes *res = (EMRecommendPageTitlesRes*)response;
        self.categorys = [EMBookBaseInfo objArrayWithDics:res.list];
        self.categoryInfo = [[EMCategoryInfo alloc] initWith:res.categoryInfo];
        
    } error:^(LQHttpError *error) {
        
    }];
    
}

@end
