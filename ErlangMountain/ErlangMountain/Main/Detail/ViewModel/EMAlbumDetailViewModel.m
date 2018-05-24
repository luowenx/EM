//
//  EMAlbumDetailViewModel.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/26.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAlbumDetailViewModel.h"
#import "EMAlbumDetailReq.h"
#import "EMAlbumManager.h"

@interface EMAlbumDetailViewModel ()

@property (nonatomic, strong) EMAlbumBaseInfo * albumInfo;

@property (nonatomic, strong, readwrite) NSMutableArray<EMPlayItemInfo *> * dataArray;

@property (nonatomic, strong, readwrite) EMAlbumObj * albumObj;

@property (nonatomic, readwrite) BOOL isCollectioned;

@end

@implementation EMAlbumDetailViewModel

- (instancetype)initWithAlbumInfo:(EMAlbumBaseInfo *)albumInfo
{
    self = [super init];
    if (self) {
        _albumInfo = albumInfo;
        RAC(self, isCollectioned) = RACObserve(self.albumInfo, isCollectioned);
        self.dataArray = [NSMutableArray array];
        [self fetchData];
        [EMAlbums synchroObj:self.albumInfo compareKey:@"albumId" synchroKey:@"isCollectioned"];
    }
    return self;
}

-(void)fetchData
{
    page_ = 1;
    EMAlbumDetailReq *req = [[EMAlbumDetailReq alloc] init];
    [req apendRelativeUrlWith:[NSString stringWithFormat:@"/%@/true/%@/20?device=iPhone&position=1", @(self.albumInfo.albumId), @(page_)]];
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMAlbumDetailRes *res = (EMAlbumDetailRes *)response;
        self.albumObj = [[EMAlbumObj alloc] initWith:res.album];
        
        [self.dataArray removeAllObjects];
        
        [self willChangeValueForKey:@"dataArray"];
        [self.dataArray addObjectsFromArray:[EMPlayItemInfo objArrayWithDics:res.list]];
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
    EMAlbumDetailReq *req = [[EMAlbumDetailReq alloc] init];
    [req apendRelativeUrlWith:[NSString stringWithFormat:@"/%@/true/%@/20?device=iPhone&position=1", @(self.albumInfo.albumId), @(page_)]];
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMAlbumDetailRes *res = (EMAlbumDetailRes *)response;        
        [self willChangeValueForKey:@"dataArray"];
        [self.dataArray addObjectsFromArray:[EMPlayItemInfo objArrayWithDics:res.list]];
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

-(RACCommand *)collectionCommand
{
    if (!_collectionCommand) {
        @weakify(self)
        _collectionCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            self_weak_.albumInfo.isCollectioned = !self_weak_.albumInfo.isCollectioned;
            if (!self_weak_.albumInfo.isCollectioned) {
                [EMAlbums deleteObj:self_weak_.albumInfo compareKey:@"albumId"];
            }else{
                [EMAlbums insertObj:self_weak_.albumInfo compareKey:@"albumId"];
            }
            return [RACSignal empty];
        }];
    }
    return _collectionCommand;
}

@end
