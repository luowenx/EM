//
//  EMCommodDef.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/13.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#ifndef EMCommodDef_h
#define EMCommodDef_h

#import "UIColor+Standard.h"
#import "UIFont+Standard.h"
#import "UIView+ActivityIndicatorView.h"
#import "MCSPageingView.h"


/**
 热门分类类型

 - kEMCategoryTypeNone: <#kEMCategoryTypeNone description#>
 */
typedef NS_ENUM(NSInteger, EMCategoryType){
    kEMCategoryTypeNone,
};


/**
 刷新header command status

 - kEMHeaderStatusNone: 正常
 - kEMHeaderStatusRefreshing: 正在刷新
 - kEMHeaderStatusEndRefresh: 结束刷新
 */
typedef NS_ENUM (NSInteger, EMHeaderCommendStatus){
    kEMHeaderStatusNone,
    kEMHeaderStatusRefreshing,
    kEMHeaderStatusEndRefresh,
};

/**
 刷新footer命令状态

 - kEMFooterStatusNone: 正常状态
 - kEMFooterStatusRefreshing: 正在刷新
 - kEMFooterStatusEndRefresh: 结束刷新
 - kEMFooterStatusNoMoreData: 无更多数据
 - kEMFooterStatusReSet: 重置
 */
typedef NS_ENUM (NSInteger, EMFooterCommendStatus){
    kEMFooterStatusNone,
    kEMFooterStatusRefreshing,
    kEMFooterStatusEndRefresh,
    kEMFooterStatusNoMoreData,
    kEMFooterStatusReSet,
};


//当前屏幕宽度与750屏幕(iphone6)的比例值
#define kEMSScreenFor750Scale      ([UIScreen mainScreen].bounds.size.width  / 375.f)

/**
 *  相对于750屏幕(iphone6)等比缩放
 *
 *  @param a375Point 750屏幕上的点值
 *
 *  @return <#return value description#>
 */
static inline CGFloat emPointConvertInScreenWidth4EQScale(CGFloat a375Point)
{
    return a375Point * kEMSScreenFor750Scale;
}

/* 外边距、内边距 */
//外边距
static float const kEMSMarginSuper                   = 70.f;
static float const kEMSMarginMax                     = 60.f;
static float const kEMSMarginHuge                    = 50.f;
static float const kEMSMarginLarge                   = 40.f;
static float const kEMSMarginNormal                  = 30.f;
static float const kEMSMarginSmall                   = 20.f;
static float const kEMSMarginMin                     = 15.f;
static float const kEMSMarginTiny                    = 10.f;
//内边距
static float const kEMSPaddingSuper                  = 30.f;
static float const kEMSPaddingMax                    = 25.f;
static float const kEMSPaddingHuge                   = 20.f;
static float const kEMSPaddingSpecial                = 17.f;
static float const kEMSPaddingLarge                  = 15.f;
static float const kEMSPaddingNormal                 = 10.f;
static float const kEMSPaddingSmall                  = 5.f;
static float const kEMSPaddingMin                    = 2.f;
static float const kEMSPaddingTiny                   = 1.f;

#endif /* EMCommodDef_h */
