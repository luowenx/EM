//
//  EMHotAnchorViewModel.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/7.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMHotAnchorViewModel.h"
#import "EMHotAnchorListReq.h"
#import "EMFollowsManager.h"

@interface EMHotAnchorViewModel ()

@property (nonatomic, strong, readwrite) NSMutableArray<EMPeakAnchor *> * dataArray;

@property (nonatomic, strong) EMFieryListObj * fieryObj;

@end
@implementation EMHotAnchorViewModel

- (instancetype)initWithFieryListObj:(EMFieryListObj *)fieryObj
{
    self = [super init];
    if (self) {
        _fieryObj = fieryObj;
        self.dataArray = [NSMutableArray array];
        [self fetchData];
    }
    return self;
}

-(void)fetchData
{
    page_ = 1;
    EMHotAnchorListReq *req = [[EMHotAnchorListReq alloc] init];
    req.category_name = self.fieryObj.name;
    req.page = page_;
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMHotAnchorListRes * res = (EMHotAnchorListRes*)response;
        [self.dataArray removeAllObjects];
        
        [self willChangeValueForKey:@"dataArray"];
        [self.dataArray addObjectsFromArray:[EMPeakAnchor objArrayWithDics:res.list]];
        [self.dataArray enumerateObjectsUsingBlock:^(EMPeakAnchor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [EMFollows synchroObj:obj compareKey:@"uid" synchroKey:@"isFollowed"];
        }];
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
    EMHotAnchorListReq *req = [[EMHotAnchorListReq alloc] init];
    req.category_name = self.fieryObj.name;
    req.page = page_;
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMHotAnchorListRes * res = (EMHotAnchorListRes*)response;
        NSArray *netArray = [EMPeakAnchor objArrayWithDics:res.list];
        [netArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [EMFollows synchroObj:obj compareKey:@"uid" synchroKey:@"isFollowed"];
        }];
        [self willChangeValueForKey:@"dataArray"];
        [self.dataArray addObjectsFromArray:netArray];
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
            input.isFollowed = !input.isFollowed;
            if (input.isFollowed) {
                [EMFollows insertObj:input compareKey:@"uid"];
            }else{
                [EMFollows deleteObj:input compareKey:@"uid"];
            }
            return [RACSignal empty];
        }];
    }
    return _followCommand;
}

@end
