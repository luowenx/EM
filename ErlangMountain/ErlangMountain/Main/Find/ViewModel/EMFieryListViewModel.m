//
//  EMFieryListViewModel.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/25.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMFieryListViewModel.h"
#import "EMFieryListReq.h"
#import "EMAnchor.h"
#import "EMPeakAnchor.h"
#import "EMFollowAnchorReq.h"

#import "EMFollowsManager.h"

@interface EMFieryListViewModel ()
@property (nonatomic, strong, readwrite) NSMutableArray<EMFieryListObj *> * dataArray;

@end

@implementation EMFieryListViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataArray = [NSMutableArray array];
        [self fetchData];
    }
    return self;
}

-(void)fetchData
{
    page_  = 1;
    EMFieryListReq *req = [[EMFieryListReq alloc] init];
    req.page = page_;
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMFieryListRes *res = (EMFieryListRes *)response;
        [self.dataArray removeAllObjects];
        
        [self willChangeValueForKey:@"dataArray"];
        [self.dataArray addObjectsFromArray:[EMFieryListObj objArrayWithDics:res.list]];
        [self didChangeValueForKey:@"dataArray"];
        
        if (self.page >= res.maxPageId) {
            [self.footerStatusCommand execute:@(kEMFooterStatusNoMoreData)];
        }else{
            [self.footerStatusCommand execute:@(kEMFooterStatusReSet)];
        }
        
        [self.headerStatusCommand execute:@(kEMHeaderStatusEndRefresh)];

    } error:^(LQHttpError *error) {
        
        [self.headerStatusCommand execute:@(kEMHeaderStatusEndRefresh)];
        [self.errorCommand execute:error];
        
    }];
    
}

-(void)loadMoreData
{
    page_ ++;
    EMFieryListReq *req = [[EMFieryListReq alloc] init];
    req.page = page_;
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMFieryListRes *res = (EMFieryListRes *)response;
        
        [self willChangeValueForKey:@"dataArray"];
        [self.dataArray addObjectsFromArray:[EMFieryListObj objArrayWithDics:res.list]];
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

-(RACCommand *)followCommand
{
    if (!_followCommand) {
        _followCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(EMAnchor *input) {
            if (input.isFollowed) {
                input.isFollowed = !input.isFollowed;
                [EMFollows deleteObj:input compareKey:@"uid"];
            }else{
                [EMFollows followAnchor:input];
            }
            return [RACSignal empty];
        }];
    }
    return _followCommand;
}



@end
