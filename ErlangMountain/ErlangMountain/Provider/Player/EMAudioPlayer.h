//
//  EMAudioPlayer.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/27.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AvailabilityMacros.h>
#import <AVFoundation/AVFoundation.h>

//当前播放状态
typedef NS_ENUM(NSUInteger, EMMediaPlayerStatus) {
    //当前处于未开始或者停止状态
    kEMMediaPlayerStatusNormal = 0,
    
    //处于暂停状态
    kEMMediaPlayerStatusPause,
    
    //处于暂停状态并且缓冲中
    kEMMediaPlayerStatusBuffering,
    
    //播放中
    kEMMediaPlayerStatusPlaying,
};

//当前播放的文件类型
typedef NS_ENUM(NSInteger, EMMediaURLType){
    kEMMediaURLTypeLocal,//本地文件
    kEMMediaURLTypePlayDownloading,//边下边播
    kEMMediaURLTypeOnlineFlow,//在线流媒体
};

//播放器回调
@protocol IHCMediaPlayerDelegate <NSObject>
@optional
/**
 *  播放器item播放失败,
 *
 *  @param aError <#aError description#>
 */
- (void)emMediaPlayerItem:(AVPlayerItem *)aItem didFailed:(NSError *)aError;
//播放元素 准备播放
- (void)emMediaPlayerItemReadyToPlay:(AVPlayerItem *)aItem;

//已经预加载到多少时长
- (void)emMediaPlayerItem:(AVPlayerItem *)aItem preLoaded:(CGFloat)aTimeSec;

//当前已经播放到多少时间
- (void)emMediaPlayerItem:(AVPlayerItem *)aItem curTime:(CGFloat)aTimeSec;

//播放完成
- (void)emMediaPlayerControlDidReachEnd:(AVPlayerItem *)item;

@end

/**
 播放器
 */
#define EMPlayer [EMAudioPlayer shareInstance]
@interface EMAudioPlayer : NSObject

//当前播放元素
@property (nonatomic, readonly) AVPlayerItem *currentItem;

//当前播放时元素总时长
@property (nonatomic, readonly) CGFloat curItemDurationTime;

//当前播放元素的缓冲进度
@property (nonatomic, readonly) CGFloat curItemPreloadTime;

//当前播放时间
@property (nonatomic, readonly) CGFloat curItemPlayTime;

//当前播放状态
@property (nonatomic, readonly) EMMediaPlayerStatus playStatus;

//是否正在播放
@property (nonatomic, readonly) BOOL isPlaying;

//回调代理
@property (nonatomic, weak) id<IHCMediaPlayerDelegate> delegate;

//是否能够后台控制
@property (nonatomic, readonly) BOOL needBackTrack;

//准备播放某一个item，但是需要请求playinfo,请求完成后调用playWithUrl:..
- (void)requestPlayInfo4PlayItem:(id)aMediaItem;

/**
 播放一个 歌曲
 
 @param aUrl 歌曲地址，可以是网络地址也可以是本地目录path
 @param aMediaItem 数据模型，用以回调
 @param aUrlType 播放URL类型
 @param aNeedBackground 是否需要后台控制
 @return 播放源
 */
- (AVPlayerItem *)playWithUrl:(NSURL*)aUrl withMediaItem:(id)aMediaItem urlType:(EMMediaURLType)aUrlType needOnbackground:(BOOL)aNeedBackground;
- (void)playPlayItem:(AVPlayerItem *)aItem;
- (void)playPlayItem:(AVPlayerItem *)aItem
             URLType:(EMMediaURLType)URLType;
- (AVPlayerItem *)playWithUrl:(NSURL *)aUrl withMediaItem:(id)aMediaItem urlType:(EMMediaURLType)aUrlType;

//设置缓冲百分比，播放本地文件设置为1.f，如果是本地代理服务器则下载多少设置多少百分比
- (void)setPreloadPercent:(CGFloat)aPercent;

//继续播放
- (void)playManual;

//手动暂停
- (void)pauseManual;
- (void)pause; //临时暂停

//停止播放
- (void)stop;
//是否停止中
- (BOOL)isStopped;

- (void)seekToTime:(double)aTimeSec;
/**
 *  查询 并从某一个时刻开始播放
 *
 *  @param aTimeSec        aTimeSec播放时间点，单位秒
 *  @param completionBlock 播放结果回调，finished表示播放失败，比如缓冲小于aTimeSec必定发生
 */
- (void)seekToTime:(double)aTimeSec withCompletionBlock:(void (^)(BOOL finished))completionBlock;

/**
 * Vidio layer
 *
 *  @return a view's layer of vedio/mp4
 */
- (AVPlayerLayer *)playerLayer;

+ (EMAudioPlayer *)shareInstance;

@end

//为AVPlayerItem增加songID属性，标记当前播放的歌曲对应于的songid
@interface AVPlayerItem (MediaItem)

//歌曲唯一标识
@property (nonatomic, strong, readonly) id mediaItem;

//当前播放的url
@property (nonatomic, strong, readonly) NSURL *playURL;

@end
