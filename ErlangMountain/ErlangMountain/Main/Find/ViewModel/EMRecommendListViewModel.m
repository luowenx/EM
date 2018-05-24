//
//  EMRecommendListViewModel.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/20.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMRecommendListViewModel.h"

#import "EMRecommendListReq.h"

#import "EMHotRecommendObj.h"
#import "EMRecommendItem.h"

@interface EMRecommendListViewModel ()
@property (nonatomic, strong, readwrite) NSArray <EMFocuseImage *>*focusImages;
@property (nonatomic, strong, readwrite) NSArray<EMHotRecommendObj *> * hotRecommends;

@end

@implementation EMRecommendListViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self fetchData];
    
    }
    return self;
}

-(void)fetchData
{
    EMRecommendListReq *req = [[EMRecommendListReq alloc] init];
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMRecommendListRes *res = (EMRecommendListRes *)response;
        self.focusImages = [EMFocuseImage objArrayWithDics:res.focusImages[@"list"]];
        self.hotRecommends = [EMHotRecommendObj objArrayWithDics:res.hotRecommends[@"list"]];
        [self.headerStatusCommand execute:@(kEMHeaderStatusEndRefresh)];
    } error:^(LQHttpError *error) {
        
        [self.headerStatusCommand execute:@(kEMHeaderStatusEndRefresh)];
        
        [self.errorCommand execute:error];
    }];
    
}

@end
