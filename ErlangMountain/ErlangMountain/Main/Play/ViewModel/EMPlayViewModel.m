//
//  EMPlayViewModel.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/2.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPlayViewModel.h"
#import "EMPlayItemInfo.h"
#import "EMAudioPlayer.h"
#import "EMAnchorInfo.h"
#import "EMPlayDetailObj.h"
#import "EMPlayAudioReq.h"
#import "EMPlayHistoryManager.h"

@interface EMPlayViewModel ()<IHCMediaPlayerDelegate>
@property (nonatomic, strong, readwrite) NSMutableArray <EMPlayItemInfo*> *playList;
@property (nonatomic, strong, readwrite) EMPlayDetailObj *detailObj;
@property (nonatomic, strong, readwrite) EMPlayItemInfo *playItemInfo;
@property (nonatomic, readwrite) CGFloat currentTime;
@property (nonatomic, readwrite) BOOL  isPlaying;

@end

static EMPlayViewModel *_instance = nil;
@implementation EMPlayViewModel

+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[EMPlayViewModel alloc] init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _playList = [NSMutableArray arrayWithCapacity:0];
        RAC(self, isPlaying) = RACObserve(EMPlayer, isPlaying);
    }
    return self;
}

#pragma mark ========= getter
-(RACCommand *)playCommand
{
    if (!_playCommand) {
        _playCommand = [[RACCommand alloc] initWithEnabled:[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@(YES)];
            return [RACDisposable disposableWithBlock:^{ }];
        }] signalBlock:^RACSignal *(id input) {
            UIButton *playButton = input;
            if (playButton.isSelected) {
                [EMPlayer pauseManual];
            }else{
                [EMPlayer playManual];
            }
            return [RACSignal empty];
        }];
    }
    return _playCommand;
}

-(RACCommand *)previousCommand
{
    @weakify(self)
    if (!_previousCommand) {
        _previousCommand = [[RACCommand alloc] initWithEnabled:[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@(YES)];
            return [RACDisposable disposableWithBlock:^{ }];
        }] signalBlock:^RACSignal *(id input) {
            [self_weak_ playPrevious];
            return [RACSignal empty];
        }];
    }
    return _previousCommand;
}

-(RACCommand *)nextCommand
{
    @weakify(self)
    if (!_nextCommand) {
        _nextCommand = [[RACCommand alloc] initWithEnabled:[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@(YES)];
            return [RACDisposable disposableWithBlock:^{ }];
        }] signalBlock:^RACSignal *(id input) {
            [self_weak_ playNextItem];
            return [RACSignal empty];
        }];
    }
    return _nextCommand;
}

#pragma mark ==== public
-(void)seekToTime:(double)atime
{
    [EMPlayer seekToTime:atime];
}

-(void)fetchData
{
    EMPlayAudioReq *req = [[EMPlayAudioReq alloc] init];
    req.trackId = [@(self.playItemInfo.trackId) asNSString];
    [req requestWithCompletion:^(LQHttpResponse *response) {
        self.detailObj = [[EMPlayDetailObj alloc] initWith:response.data];
    } error:^(LQHttpError *error) {
        
    }];
    
}

#pragma mark ==== IHCMediaPlayerDelegate
//当前已经播放到多少时间
- (void)emMediaPlayerItem:(AVPlayerItem *)aItem curTime:(CGFloat)aTimeSec
{
    self.currentTime = aTimeSec;
}

//播放完成
- (void)emMediaPlayerControlDidReachEnd:(AVPlayerItem *)item
{
    [self playNextItem];
}

- (void)emMediaPlayerItem:(AVPlayerItem *)aItem didFailed:(NSError *)aError
{
    [self playNextItem];
}

#pragma mark ==== PlayQueue
-(void)playWithPlayItemInfo:(EMPlayItemInfo *)playItemInfo
{
    if (playItemInfo == self.playItemInfo) {
        return;
    }
    self.playItemInfo = playItemInfo;
    if (![self.playList containsObject:playItemInfo]) {
        [self.playList addObject:playItemInfo];
    }
    [self playDownloading];
}

-(void)playItems:(NSArray<EMPlayItemInfo*>*)playItems
{
    if (playItems.count == 0) {return;}
    EMPlayItemInfo *playItemInfo = playItems.firstObject;
    self.playItemInfo = playItemInfo;
    [self.playList addObjectsFromArray:playItems.copy];
    [self playDownloading];
}

-(void)resetPlayList:(NSArray<EMPlayItemInfo*>*)playItems
{
    [EMPlayer stop];
    [self.playList removeAllObjects];
    [self playItems:playItems];
}

-(void)playNextItem
{
    NSInteger index = [self.playList indexOfObject:self.playItemInfo];
    
    if (index == NSNotFound) {
        return;
    }
    NSInteger nextIndex = index + 1;
    if (nextIndex >= self.playList.count) {
        nextIndex = 0;
    }
    self.playItemInfo = [self.playList safeObjectAtIndex:nextIndex];
    [self playDownloading];
}

-(void)playPrevious
{
    NSInteger index = [self.playList indexOfObject:self.playItemInfo];
    if (index == NSNotFound) {
        return;
    }
    NSInteger previousIndex = index - 1;
    if (previousIndex<0) {
        self.playItemInfo = self.playList.lastObject;
    }else{
        self.playItemInfo = [self.playList safeObjectAtIndex:previousIndex];
    }
    [self playDownloading];
}

-(void)playDownloading
{
    [EMHistorys addToHistory:self.playItemInfo];
    [self fetchData];
    if (!self.playItemInfo) {
        return;
    }
    [self play:[NSURL URLWithString:self.playItemInfo.playUrl64] type:(kEMMediaURLTypePlayDownloading)];
}

-(void)play:(NSURL*)url type:(EMMediaURLType)type
{
    if (url.isFileURL) {
        [EMPlayer playWithUrl:url withMediaItem:nil urlType:type];
        return;
    }
    
    AVURLAsset *asset = [AVURLAsset assetWithURL:url];
    AVPlayerItem *item = [AVPlayerItem playerItemWithAsset:asset];
    [EMPlayer playPlayItem:item URLType:type];
    EMPlayer.delegate = self;
}

@end
