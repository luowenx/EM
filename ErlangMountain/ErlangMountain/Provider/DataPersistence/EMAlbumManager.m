//
//  EMAlbumManager.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/10.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMAlbumManager.h"
#import "EMAlbumBaseInfo.h"

@implementation EMAlbumManager
{
    NSMutableDictionary *aParameters_;
}

static id _albumPersistence = nil;
+(instancetype)sharePersistence
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _albumPersistence = [[[self class] alloc] init];
    });
    return _albumPersistence;
}

- (void)persistenceObjWithDic:(NSDictionary*)localDic
{
    if (localDic.count == 0) {
        return;
    }
    [self.container removeAllObjects];
    [self.container addObjectsFromArray:[EMAlbumBaseInfo objArrayWithDics:localDic[@"collectionAlbums"]]];
}

+ (NSString *)persistencePath
{
    return kEMPathCollectionData;
}

- (NSDictionary *)toJSON
{
    if (!aParameters_) {
        aParameters_ = [NSMutableDictionary dictionary];
    }
    [aParameters_ setObject:self.container.toJSON forKey:@"collectionAlbums"];
    
    return aParameters_.copy;
}

@end
