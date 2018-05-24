//
//  EMPlayViewModel.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/2.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMViewModel.h"
#import "EMAnchorInfo.h"
#import "EMPlayDetailObj.h"

/**
 播放页
 为方便复用，本类为单例，请使用单例初始化方式
 */
@class EMPlayItemInfo;
@interface EMPlayViewModel : EMViewModel
// -------------- data ------------------ //
@property (nonatomic, strong, readonly) NSMutableArray <EMPlayItemInfo*> *playList;

@property (nonatomic, strong, readonly) EMPlayDetailObj *detailObj;

/** 当前播放元素 */
@property (nonatomic, strong, readonly) EMPlayItemInfo *playItemInfo;

/** 当前播放进度 */
@property (nonatomic, readonly) CGFloat currentTime;
/** 当前播放状态 */
@property (nonatomic, readonly) BOOL  isPlaying;

// -------------- command ------------------ //
/** 播放按钮Command  */
@property (nonatomic, strong) RACCommand *playCommand;
/** previous button Command  */
@property (nonatomic, strong) RACCommand *previousCommand;
/** next button Command  */
@property (nonatomic, strong) RACCommand *nextCommand;

//  ---------------- public  -------------------- //
/**
设置播放进度
 @param atime 设置到 atime 这个时刻
 */
-(void)seekToTime:(double)atime;


// 这是一个单例
+(instancetype)shareInstance;

@end

/* 播放队列 */
@interface EMPlayViewModel (PlayQueue)

/**
 使一个作品变成当前播放
 @param playItemInfo 该作品对象
 */
-(void)playWithPlayItemInfo:(EMPlayItemInfo *)playItemInfo;

/**
 顺序播放一个作品组
 @param playItems 作品数组
 */
-(void)playItems:(NSArray<EMPlayItemInfo*>*)playItems;

/**
 重置播放列表
 @param playItems 播放列表原来的作品将会被清空
 */
-(void)resetPlayList:(NSArray<EMPlayItemInfo*>*)playItems;

@end
