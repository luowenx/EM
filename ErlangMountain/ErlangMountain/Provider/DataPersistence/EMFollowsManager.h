//
//  EMFollowsManager.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/7.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMDataPersistence.h"

/**
 关注数据
 */

#define EMFollows [EMFollowsManager sharePersistence]
@class EMAnchor;
@interface EMFollowsManager : EMDataPersistence

/**
 关注一个主播
 是否关注成功，请监听 anchor的属性
 @param anchor  主播对象
 */
-(void)followAnchor:(EMAnchor *)anchor;

@end
