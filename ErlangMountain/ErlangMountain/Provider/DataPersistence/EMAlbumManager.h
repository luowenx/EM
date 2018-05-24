//
//  EMAlbumManager.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/10.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMDataPersistence.h"

/**
 收藏专辑
 */
#define EMAlbums [EMAlbumManager sharePersistence]

@class EMAlbumBaseInfo;
@interface EMAlbumManager : EMDataPersistence

@end
