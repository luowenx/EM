//
//  EMAudioPlayer.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/27.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAudioPlayer.h"
#import <AudioToolbox/AudioSession.h>
#import <objc/runtime.h>

//播放器缓冲进度偏移量-秒，如果当前播放时间大于 缓冲进度时间减去kMediaPlayerPercentOffsetTime秒，则暂停，如果缓冲已完成，则该值无效
#define kMediaPlayerPercentOffsetTime 10.f

//songid 存储唯一标识符
static const void* AVPlayerItemSongItem = &AVPlayerItemSongItem;
static const void* AVPlayerItemPlayUrl = &AVPlayerItemPlayUrl;
@implementation AVPlayerItem (MediaItem)
@dynamic mediaItem, playURL;

- (void)setMediaItem:(id)mediaItem
{
    objc_setAssociatedObject(self, AVPlayerItemSongItem, mediaItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)mediaItem
{
    return objc_getAssociatedObject(self, AVPlayerItemSongItem);
}

- (void)setPlayURL:(NSURL*)aPlayURL
{
    objc_setAssociatedObject(self, AVPlayerItemPlayUrl, aPlayURL, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSURL*)playURL
{
    return objc_getAssociatedObject(self, AVPlayerItemPlayUrl);
}

@end

@interface EMAudioPlayer ()
//播放器
@property (nonatomic, strong) AVPlayer * mediaPlayer;

//空音频item
@property (nonatomic, strong) AVPlayerItem* emptyItem;

@property (nonatomic, strong) AVPlayerItem* currentItem;

//当前播放时元素总时长
@property (nonatomic) CGFloat curItemDurationTime;

@property (nonatomic) CGFloat curItemPreloadTime;

//当前播放时间
@property (nonatomic) CGFloat curItemPlayTime;

//当前是否处于空闲状态
@property (nonatomic) BOOL isFree;

//填充
- (BOOL)fillEmptySound2Player;

//注册通知
- (void)registerAudioSessionNotification;

//是否已停止或者已经播放错误
@property (nonatomic) BOOL isStopped;

//是否在线流媒体播放,缓冲时间使用原有系统加载逻辑
//播放方式有：在线流媒体、边下边播、本地文件
@property (nonatomic) EMMediaURLType urlType;

//当前下载缓冲进度,本地文件为1.在线流媒体设置无效
@property (nonatomic) CGFloat preloadTimePercent;

//是否正在缓冲中，只针对边下边播或者在线流媒体
@property (nonatomic) BOOL isBuffering;

@end

@implementation EMAudioPlayer{
    //后台任务id
    UIBackgroundTaskIdentifier bgTaskId;
    UIBackgroundTaskIdentifier removedId;
    
    //被强制暂停
    BOOL isPauseReasonForced_;
    
    //当播放时 输出设备改变
    BOOL isRouteChangedWhilePlaying_;
    
    //是否播放被打断
    BOOL isInterruptedWhilePlaying_;
    
    
    //是否已经开始播放
    BOOL isStartPlayed_;
    
    //准备播放歌曲，是否正在请求playInfo
    BOOL willPlayInPlayInfo_;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isFree = YES;
        [self initialAudioPlayer];
    }
    return self;
}

-(void)initialAudioPlayer
{
    if (self.mediaPlayer) {
        return;
    }
    //初始化播放器
    if (![self fillEmptySound2Player]) {
        NSLog(@"fillEmptySound2Player error");
        return;
    }
    
    [self registerAudioSessionNotification];
    
    @weakify(self)
    if (@available(iOS 10.0, *)){
        RAC(self, isPlaying) = [[RACSignal combineLatest:@[ RACObserve(self.mediaPlayer, timeControlStatus), RACObserve(self, isFree) ]] map:^id(RACTuple* value) {
            @strongify(self)
            if ([(NSNumber*)value.second boolValue]) {
                return @NO;
            }
            return @([self.mediaPlayer timeControlStatus] == AVPlayerTimeControlStatusPlaying);
        }];
    }  else {
        RAC(self, isPlaying) = [[RACSignal combineLatest:@[ RACObserve(self.mediaPlayer, rate), RACObserve(self, isFree) ]] map:^id(RACTuple* value) {
            @strongify(self)
            if ([(NSNumber*)value.second boolValue]) {
                return @NO;
            }
            return @([self.mediaPlayer rate] != 0.f);
        }];
    }
}

+ (instancetype)shareInstance
{
    static EMAudioPlayer* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (EMMediaPlayerStatus)playStatus
{
    BOOL isPlaying = [self isPlaying];
    if (isPlaying) {
        return kEMMediaPlayerStatusPlaying;
    }
    else if (isPauseReasonForced_) {
        return kEMMediaPlayerStatusPause;
    }
    else if (self.isBuffering) {
        return kEMMediaPlayerStatusBuffering;
    }
    else {
        return kEMMediaPlayerStatusNormal;
    }
}

#pragma mark - Public
- (void)requestPlayInfo4PlayItem:(id)aMediaItem
{
    willPlayInPlayInfo_ = YES;
}

/**
 *  当 当前缓冲已经达到已下载的满额时，不再触发缓冲的问题
 *
 *  @param aPercent <#aPercent description#>
 */
- (void)setPreloadPercent:(CGFloat)aPercent
{
    //由于把该值作为 播放器的预加载时间，导致 播放器实际的预加载时间小于该值，引起触发播放无效的情况
    if (self.isStopped) {
        return;
    }
    if (self.urlType == kEMMediaURLTypeOnlineFlow) {
        return;
    }
    if (aPercent <= 0) {
        aPercent = 0;
    }
    if (aPercent >= 1.0f) {
        aPercent = 1.0f;
    }
    
    //如果还为开始播放
    if (self.curItemDurationTime < 0.0001) {
        return;
    }

    //已下载的时间
    CGFloat hasDownTime = self.curItemDurationTime * aPercent;
    if (!isPauseReasonForced_ && (hasDownTime > self.curItemPreloadTime + kMediaPlayerPercentOffsetTime || hasDownTime + 1.f > self.curItemDurationTime) && !isInterruptedWhilePlaying_ && !isRouteChangedWhilePlaying_ && ![self isPlaying]) {
        [self play]; //通知播放器缓冲
    }
}

//播放
- (void)playPlayItem:(AVPlayerItem *)aItem
{
    [self playPlayItem:aItem URLType:kEMMediaURLTypeLocal];
}

- (void)playPlayItem:(AVPlayerItem *)aItem URLType:(EMMediaURLType)URLType
{
    [self checkAudioSessionState];
    
    _needBackTrack = NO;
    
    isStartPlayed_ = NO;
    
    if (aItem) {
        self.urlType = URLType;
        
        [self.mediaPlayer replaceCurrentItemWithPlayerItem:aItem];
        self.curItemPreloadTime = CMTimeGetSeconds([aItem duration]);
        self.currentItem = aItem;
        
        if (willPlayInPlayInfo_ && isInterruptedWhilePlaying_) {
            //如果是中断
            [self playManual];
            [self pause];
            isInterruptedWhilePlaying_ = YES;
        } else {
            [self playManual];
        }
        willPlayInPlayInfo_ = NO;
    }
}

- (AVPlayerItem *)playWithUrl:(NSURL*)aUrl withMediaItem:(id)aMediaItem urlType:(EMMediaURLType)aUrlType
{
    return [self playWithUrl:aUrl withMediaItem:aMediaItem urlType:aUrlType needOnbackground:YES];
}

- (AVPlayerItem *)playWithUrl:(NSURL*)aUrl withMediaItem:(id)aMediaItem urlType:(EMMediaURLType)aUrlType needOnbackground:(BOOL)aNeedBackground
{
    AVPlayerItem* playerItem = [AVPlayerItem playerItemWithURL:aUrl];
    [self checkAudioSessionState];
    
    _needBackTrack = aNeedBackground;
    
    isStartPlayed_ = NO;
    
    if (playerItem) {
        self.urlType = aUrlType;
        
        playerItem.mediaItem = aMediaItem;
        playerItem.playURL = aUrl;
        [self.mediaPlayer replaceCurrentItemWithPlayerItem:playerItem];
        self.currentItem = playerItem;
        
        if (willPlayInPlayInfo_ && isInterruptedWhilePlaying_) {
            //如果是中断
            [self playManual];
            [self pause];
            isInterruptedWhilePlaying_ = YES;
        } else {
            [self playManual];
        }
        willPlayInPlayInfo_ = NO;
    }
    return playerItem;
}

//继续播放
- (void)playManual
{
    isPauseReasonForced_ = NO;
    isInterruptedWhilePlaying_ = NO;
    isRouteChangedWhilePlaying_ = NO;
    
    willPlayInPlayInfo_ = NO;
    [self play];
}


-(void)play
{
    self.isStopped = NO;
    self.isFree = NO;
    if (@available(iOS 10.0, *)) {
        [self.mediaPlayer playImmediatelyAtRate:1.0f];
    } else {
        [self.mediaPlayer play];
    }
}

//暂停
- (void)pauseManual
{
    isPauseReasonForced_ = YES;
    [self pause];
}

//暂停播放
- (void)pause
{
    [self.mediaPlayer pause];
}

//停止播放
- (void)stop
{
    self.isFree = YES;
    [self pauseManual];
    self.curItemDurationTime = 0.f;
    self.curItemPreloadTime = 0.f;
    self.curItemPlayTime = 0.f;
    self.preloadTimePercent = 0.0f;
    self.isStopped = YES;
    isStartPlayed_ = NO;
    willPlayInPlayInfo_ = NO;
    NSLog(@"停止播放");
    //必须放在最后hcMediaPlayerItemReadyToPlay
    self.currentItem = nil;
}

- (BOOL)isStopped
{
    return self.isFree;
}

- (void)seekToTime:(double)aTimeSec
{
    [self seekToTime:aTimeSec withCompletionBlock:nil];
}
- (void)seekToTime:(double)aTimeSec withCompletionBlock:(void (^)(BOOL finished))completionBlock
{
    [self.mediaPlayer seekToTime:CMTimeMakeWithSeconds(aTimeSec, NSEC_PER_SEC)
               completionHandler:^(BOOL finished) {
                   if (completionBlock) {
                       completionBlock(finished);
                   }
               }];
}

- (AVPlayerLayer*)playerLayer
{
    return [AVPlayerLayer playerLayerWithPlayer:self.mediaPlayer];
}

#pragma mark - Private
//检查重置为Playback
-(void)checkAudioSessionState
{
    AVAudioSession* audioSession = [AVAudioSession sharedInstance];
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    
    if (audioSession.category != AVAudioSessionCategoryPlayback || audioSession.categoryOptions != 0) {
        UIDevice* device = [UIDevice currentDevice];
        if ([device respondsToSelector:@selector(isMultitaskingSupported)]) {
            if (device.multitaskingSupported) {
                NSError* aError = nil;
                [audioSession setCategory:AVAudioSessionCategoryPlayback withOptions:0 error:&aError];
                if (aError) {
                    NSLog(@"set category error:%@", [aError description]);
                }
                aError = nil;
                [audioSession setActive:NO error:&aError];
                if (aError) {
                    NSLog(@"set active error:%@", [aError description]);
                }
            }
        }
    }
    
    NSError* aError = nil;
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"portType = %@", AVAudioSessionPortBuiltInSpeaker];
    if ([audioSession.currentRoute.outputs filteredArrayUsingPredicate:pre].count > 0 ) {
        [audioSession setMode:AVAudioSessionModeDefault error:&aError];
        if (aError) {
            NSLog(@"set category error:%@", [aError description]);
        }
    } else {
        [audioSession setMode:AVAudioSessionModeMeasurement error:&aError];
        if (aError) {
            NSLog(@"set category error:%@", [aError description]);
        }
    }
}

- (BOOL)fillEmptySound2Player
{
    isPauseReasonForced_ = YES;
    if (self.mediaPlayer) {
        [self.mediaPlayer replaceCurrentItemWithPlayerItem:self.emptyItem];
    } else {
        self.mediaPlayer = [AVPlayer playerWithPlayerItem:self.emptyItem];
        @weakify(self)
        [self.mediaPlayer addPeriodicTimeObserverForInterval:CMTimeMake(5, 20)
                                                       queue:dispatch_get_main_queue()
                                                  usingBlock:^(CMTime time) {
                                                      @strongify(self)
                                                      if ([self.mediaPlayer.currentItem isEqual:self.emptyItem]) {
                                                          return;
                                                      }
                                                      if (self.isStopped) {
                                                          return;
                                                      }
                                                      CGFloat curTime = CMTimeGetSeconds(time);
                                                      if (!isnan(curTime) && !isnan(self.curItemDurationTime) && curTime >= 0 && self.curItemDurationTime > 0.0001f) {
                                                          self.curItemPlayTime = curTime;
                                                          
                                                          if (self.mediaPlayer.currentItem.status == AVPlayerItemStatusReadyToPlay && [self.delegate respondsToSelector:@selector(emMediaPlayerItem:curTime:)]) {
                                                              [self.delegate emMediaPlayerItem:self.mediaPlayer.currentItem curTime:self.curItemPlayTime];
                                                              
                                                              if (self.urlType != kEMMediaURLTypeLocal && (self.curItemPreloadTime < self.curItemPlayTime + kMediaPlayerPercentOffsetTime) && (self.curItemPreloadTime + 1.f < self.curItemDurationTime)) {
//                                                                  [self pause];
                                                                  self.isBuffering = YES;
                                                                  [self longTimeBufferBackground];
                                                                  NSLog(@"由于缓冲时间不够，暂停");
                                                              }
                                                          }
                                                      }
                                                  }];
    }
    self.currentItem = nil;
    self.curItemDurationTime = 0.f;
    self.curItemPreloadTime = 0.f;
    self.curItemPlayTime = 0.f;
    self.preloadTimePercent = 0.0f;
    return YES;
}

//注册通知
- (void)registerAudioSessionNotification
{
    //注册通知 AudioSessionNotification
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(interruption:)
                                                 name:AVAudioSessionInterruptionNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(routeChange:)
                                                 name:AVAudioSessionRouteChangeNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerItemDidReachEnd:)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:nil];
    
    [self.mediaPlayer addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew context:nil];
    //    [self.mediaPlayer addObserver:self forKeyPath:@"rate" options:0 context:nil];
    [self.mediaPlayer addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

/*
 * Tells OS this application starts one or more long-running tasks, should end background task when completed.
 */
- (void)longTimeBufferBackground
{
    bgTaskId = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [[UIApplication sharedApplication] endBackgroundTask:self->removedId];
        self->bgTaskId = UIBackgroundTaskInvalid;
    }];
    
    if (bgTaskId != UIBackgroundTaskInvalid && removedId == 0 ? YES : (removedId != UIBackgroundTaskInvalid)) {
        [[UIApplication sharedApplication] endBackgroundTask:removedId];
    }
    removedId = bgTaskId;
}

- (void)longTimeBufferBackgroundCompleted
{
    if (bgTaskId != UIBackgroundTaskInvalid && removedId != bgTaskId) {
        [[UIApplication sharedApplication] endBackgroundTask:bgTaskId];
        removedId = bgTaskId;
    }
}

- (void)interruption:(NSNotification*)notification
{
    NSDictionary* interuptionDict = notification.userInfo;
    NSUInteger interuptionType = [[interuptionDict valueForKey:AVAudioSessionInterruptionTypeKey] integerValue];
    
    if (interuptionType == AVAudioSessionInterruptionTypeBegan) {
        isInterruptedWhilePlaying_ = YES;
        // bug fix: http://bugfree.oa.okchang.com/index.php?r=info/edit&type=bug&id=2581
        isPauseReasonForced_ = YES;
        [self pause];
    }
    else if (interuptionType == AVAudioSessionInterruptionTypeEnded) {
        if (isInterruptedWhilePlaying_ && !isPauseReasonForced_) {
            isPauseReasonForced_ = NO;
            [self play];
        }
        isInterruptedWhilePlaying_ = NO;
    }
}

//插拔耳机
- (void)routeChange:(NSNotification*)notification
{
    NSDictionary* routeChangeDict = notification.userInfo;
    NSUInteger routeChangeType = [[routeChangeDict valueForKey:AVAudioSessionRouteChangeReasonKey] integerValue];
    //旧设备不可用
    if (routeChangeType == AVAudioSessionRouteChangeReasonOldDeviceUnavailable) {
        isRouteChangedWhilePlaying_ = YES;
        isPauseReasonForced_ = YES;
    }
    else if (routeChangeType == AVAudioSessionRouteChangeReasonNewDeviceAvailable) { //新设备可用
        //        if (!isPauseReasonForced_) {
        //            isRouteChangedWhilePlaying_ = NO;
        //            isPauseReasonForced_ = NO;
        //            [self play];
        //        }
    }
}

- (void)playerItemDidReachEnd:(NSNotification*)notification
{
    self.isFree = YES;
    AVPlayerItem* item = [notification object];
    NSLog(@"播放完成playerItemDidReachEnd  %@", item);
    if (![item isEqual:self.mediaPlayer.currentItem]) {
        return;
    }
    
    //    [self fillEmptySound2Player];
    if ([self.mediaPlayer.currentItem isEqual:self.emptyItem]) {
        return;
    }
    if ([self.delegate respondsToSelector:@selector(emMediaPlayerControlDidReachEnd:)]) {
        [self.delegate emMediaPlayerControlDidReachEnd:item];
    }
}

//KVO
- (void)observeValueForKeyPath:(NSString*)keyPath
                      ofObject:(id)object
                        change:(NSDictionary*)change
                       context:(void*)context
{
    AVPlayerItem* loadItem = nil;
    if ([object isKindOfClass:[AVPlayerItem class]]) {
        loadItem = object;
        if (![self isCurrentWithPlayItem:loadItem]) {
            return;
        }
    }
    //播放器mediaPlayer.status
    if (object == self.mediaPlayer && [keyPath isEqualToString:@"status"]) {
        if (self.mediaPlayer.status == AVPlayerStatusReadyToPlay) {
            if (![self isPlaying]) {
                [self playManual];
            }
        }
        else if (self.mediaPlayer.status == AVPlayerStatusFailed) {

        }
    }
    
    //播放器当前播放元素改变
    if (object == self.mediaPlayer && [keyPath isEqualToString:@"currentItem"]) {
        AVPlayerItem* newPlayerItem = [change objectForKey:NSKeyValueChangeNewKey];
        AVPlayerItem* lastPlayerItem = [change objectForKey:NSKeyValueChangeOldKey];
        if (lastPlayerItem && lastPlayerItem != (id)[NSNull null] && ![lastPlayerItem isEqual:self.emptyItem]) {
            @try {
                [lastPlayerItem removeObserver:self forKeyPath:@"loadedTimeRanges" context:nil];
                [lastPlayerItem removeObserver:self forKeyPath:@"status" context:nil];
            }
            @catch (id anException) {
                //do nothing, obviously it wasn't attached because an exception was thrown
            }
        }
        if (newPlayerItem && newPlayerItem != (id)[NSNull null] && ![newPlayerItem isEqual:self.emptyItem]) {
            [newPlayerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
            [newPlayerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
        }
    }
    
    //播放元素的status
    if (loadItem && [keyPath isEqualToString:@"status"]) {
        AVPlayerItem* loadItem = object;
        if (![self isCurrentWithPlayItem:loadItem] || self.isStopped) {
            return;
        }
        
        //        isPreBuffered = NO;
        if (loadItem.status == AVPlayerItemStatusFailed) {
            self.isFree = YES;
            self.isStopped = YES;
            if ([self.delegate respondsToSelector:@selector(emMediaPlayerItem:didFailed:)]) {
                [self.delegate emMediaPlayerItem:loadItem didFailed:loadItem.error];
            }
        }
        else if (loadItem.status == AVPlayerItemStatusReadyToPlay) {
            CGFloat totalDruation = CMTimeGetSeconds(loadItem.duration);
            if (isnan(totalDruation)) {
                return;
            }
            if ([self checkPlay4PreloadAndDuration]) { //检查总时间和播放器缓冲时间
                [self play];
            } else {
                [self setPreloadPercent:self.preloadTimePercent]; //检查当前下载的百分比时间
            }
        }
        NSLog(@"playStatus changed to = %@,totaltime= %@", @(loadItem.status), @(self.curItemDurationTime));
    }
    
    //播放item 缓冲时间处理
    if (loadItem && [keyPath isEqualToString:@"loadedTimeRanges"]) {
        if (![self isCurrentWithPlayItem:loadItem]) {
            return;
        }
        if (self.isStopped) {
            return;
        }

        NSArray* timeRanges = (NSArray*)[change objectForKey:NSKeyValueChangeNewKey];
        if (timeRanges && [timeRanges count]) {
            CMTimeRange timerange = [timeRanges.firstObject CMTimeRangeValue];
            CGFloat preloadTime = CMTimeGetSeconds(CMTimeAdd(timerange.start, timerange.duration));
            self.curItemPreloadTime = preloadTime;
            NSLog(@"获取到缓冲时间 %f",preloadTime);
            if ([self.delegate respondsToSelector:@selector(emMediaPlayerItem:preLoaded:)]) {
                [self.delegate emMediaPlayerItem:object preLoaded:preloadTime];
            }
            
            //当前由于缓冲时间不够导致暂停
            if ([self checkPlay4PreloadAndDuration] && self.urlType != kEMMediaURLTypeLocal) {
                self.isBuffering = NO;
                
                [self play];
                [self longTimeBufferBackgroundCompleted];
            }
        }
    }
}

- (BOOL)isCurrentWithPlayItem:(AVPlayerItem*)object
{
    if ([object isEqual:self.mediaPlayer.currentItem]) {
        return YES;
    }
    else if ([[object asset] isKindOfClass:[AVURLAsset class]] && [[self.mediaPlayer.currentItem asset] isKindOfClass:[AVURLAsset class]]) {
        NSString* urlString = [[(AVURLAsset*)[object asset] URL] absoluteString];
        NSString* urlStringCurrent = [[(AVURLAsset*)[self.mediaPlayer.currentItem asset] URL] absoluteString];
        if ([urlString isEqualToString:urlStringCurrent]) {
            return YES;
        }
    }
    NSLog(@"检查到播放元素不是当前播放器的播放元素");
    return NO;
}


//触发播放返回YES
- (BOOL)checkPlay4PreloadAndDuration
{
    //如果当前 总时长为获取到，主动获取一次
    if (self.curItemDurationTime < 0.0001f) {
        AVPlayerItem *curItem = self.mediaPlayer.currentItem;
        CGFloat totalDruation = CMTimeGetSeconds(curItem.duration);
        if (!isnan(totalDruation)) {
            self.curItemDurationTime = totalDruation;
            if (!isStartPlayed_) {
                isStartPlayed_ = YES;
                if ([self.delegate respondsToSelector:@selector(emMediaPlayerItemReadyToPlay:)]) {
                    [self.delegate emMediaPlayerItemReadyToPlay:self.mediaPlayer.currentItem];
                }
            }
        }
    }
    if (!isPauseReasonForced_ && (self.curItemPreloadTime > self.curItemPlayTime + kMediaPlayerPercentOffsetTime || self.curItemPreloadTime + 1.f > self.curItemDurationTime) && self.mediaPlayer.currentItem.status == AVPlayerItemStatusReadyToPlay && self.curItemDurationTime > 0.0001f && !isInterruptedWhilePlaying_ && !isRouteChangedWhilePlaying_ && ![self isPlaying]) { // && self.isBuffering
        
        [self play];
        return YES;
    }
    return NO;
}

@end
