//
//  EMAnchorDetailViewModel.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/9.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAnchorDetailViewModel.h"
#import "EMAnchorDetailReq.h"
#import "EMAnchorAlbumListReq.h"
#import "EMFollowsManager.h"

@interface EMAnchorDetailViewModel ()

@property (nonatomic, strong) EMAnchor * anchor;
@property (nonatomic, strong, readwrite) EMAnchorDtailInfo *anchorDtailInfo;
@property (nonatomic, strong, readwrite) NSMutableArray<EMAnchorAlbumObj *> * dataArray;
@property (nonatomic, readwrite) NSInteger totalCount;
@property (nonatomic, readwrite) BOOL isFollowed;
@property (nonatomic, strong, readwrite) RACCommand *followCommand;

@end

@implementation EMAnchorDetailViewModel

- (instancetype)initWithAnchor:(EMAnchor*)anchor
{
    self = [super init];
    if (self) {
        _anchor = anchor;
        self.dataArray = [NSMutableArray array];
        EMAnchorDetailReq *detailReq = [[EMAnchorDetailReq alloc] init];
        detailReq.toUid = self.anchor.uid;
        [detailReq requestWithCompletion:^(LQHttpResponse *response) {
            self.anchorDtailInfo = [[EMAnchorDtailInfo alloc] initWith:response.data];
        } error:nil];
        
        [self fetchData];
        
        RAC(self, isFollowed) = RACObserve(self.anchor, isFollowed);
    }
    return self;
}

-(void)fetchData
{
    page_ = 1;
    EMAnchorAlbumListReq *albumListReq = [[EMAnchorAlbumListReq alloc] init];
    [albumListReq apendRelativeUrlWith:[NSString stringWithFormat:@"/%@/%@/20?device=iPhone", @(self.anchor.uid), @(page_)]];
    [albumListReq requestWithCompletion:^(LQHttpResponse *response) {
        EMAnchorAlbumListRes *res = (EMAnchorAlbumListRes *)response;
        self.totalCount = res.totalCount;
        [self.dataArray removeAllObjects];

        [self willChangeValueForKey:@"dataArray"];
        [self.dataArray addObjectsFromArray:[EMAnchorAlbumObj objArrayWithDics:res.list]];
        [self didChangeValueForKey:@"dataArray"];
        
        if (self.page >= res.maxPageId) {
            [self.footerStatusCommand execute:@(kEMFooterStatusNoMoreData)];
        }else{
            [self.footerStatusCommand execute:@(kEMFooterStatusReSet)];
        }
    } error:^(LQHttpError *error) {
        [self.errorCommand execute:error];
    }];
}

-(void)loadMoreData
{
    page_ ++;
    EMAnchorAlbumListReq *albumListReq = [[EMAnchorAlbumListReq alloc] init];
    [albumListReq apendRelativeUrlWith:[NSString stringWithFormat:@"/%@/%@/20?device=iPhone", @(self.anchor.uid), @(page_)]];
    [albumListReq requestWithCompletion:^(LQHttpResponse *response) {
        EMAnchorAlbumListRes *res = (EMAnchorAlbumListRes *)response;

        [self willChangeValueForKey:@"dataArray"];
        [self.dataArray addObjectsFromArray:[EMAnchorAlbumObj objArrayWithDics:res.list]];
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
        @weakify(self)
        _followCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(UIButton *input) {
            if (input.isSelected) {
                [EMFollows deleteObj:self_weak_.anchor compareKey:@"uid"];
                self_weak_.anchor.isFollowed = !self_weak_.anchor.isFollowed;
            }else{
                [EMFollows followAnchor:self_weak_.anchor];
            }
            return [RACSignal empty];
        }];
    }
    return _followCommand;
}

@end
