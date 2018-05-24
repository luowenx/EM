//
//  EMFilePathConfig.h
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/7.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#ifndef EMFilePathConfig_h
#define EMFilePathConfig_h

//-------------------文件存储路径 begin-------------------
#define PathDocuments       [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]
#define PathLibrary         [NSHomeDirectory() stringByAppendingPathComponent:@"Library"]
#define PathTemp            [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"]
#define PathPreferences     [PathLibrary stringByAppendingPathComponent:@"Preferences"]
#define PathCaches          [PathLibrary stringByAppendingPathComponent:@"Caches"]

// 关注信息
#define kEMPathFollowsData  [PathDocuments stringByAppendingPathComponent:@"kEMPathFollowsData"]

// 收藏的专辑
#define kEMPathCollectionData  [PathDocuments stringByAppendingPathComponent:@"kEMPathCollectionData"]

// 播放历史
#define kEMPathPlayHistoryData  [PathDocuments stringByAppendingPathComponent:@"kEMPathPlayHistoryData"]

// 关注数据库
#define kEMPathFollowsDBData  [PathDocuments stringByAppendingPathComponent:@"follows.sqlite"]


#endif /* EMFilePathConfig_h */
