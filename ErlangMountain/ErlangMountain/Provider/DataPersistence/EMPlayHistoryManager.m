//
//  EMPlayHistoryManager.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/10.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPlayHistoryManager.h"
#import "EMPlayItemInfo.h"
#import "EMPlayViewModel.h"

@interface EMPlayHistoryManager ()

@property (nonatomic, strong, readwrite) NSMutableArray <EMPlayItemInfo*> *historyList;
@property (nonatomic, strong, readwrite) EMPlayItemInfo *playItemInfo;

@end

@implementation EMPlayHistoryManager

{
    NSMutableDictionary *aParameters_;
}

static id _playHistoryPersistence = nil;
+(instancetype)sharePersistence
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _playHistoryPersistence = [[[self class] alloc] init];
    });
    return _playHistoryPersistence;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _historyList= [NSMutableArray array];
        
        @weakify(self)
        [RACObserve([EMPlayViewModel shareInstance], playItemInfo) subscribeNext:^(EMPlayItemInfo* x) {
            if (!x || self_weak_.playItemInfo.albumId == x.albumId) {
                return ;
            }
            self_weak_.playItemInfo = x;
            [self_weak_ persistence];
        }];

    }
    return self;
}

- (void)persistenceObjWithDic:(NSDictionary*)localDic
{
    if (localDic.count == 0) {
        return;
    }
    [self.historyList removeAllObjects];
    [self.historyList addObjectsFromArray:[EMPlayItemInfo objArrayWithDics:localDic[@"playHistory"]]];
    self.playItemInfo = [[EMPlayItemInfo alloc] initWith:localDic[@"curruntPlayItemInfo"]];
}

+ (NSString *)persistencePath
{
    return kEMPathPlayHistoryData;
}

- (NSDictionary *)toJSON
{
    if (!aParameters_) {
        aParameters_ = [NSMutableDictionary dictionary];
    }
    [aParameters_ setObject:self.historyList.toJSON forKey:@"playHistory"];

    if (self.playItemInfo) {
        [aParameters_ setObject:self.playItemInfo.toJSON forKey:@"curruntPlayItemInfo"];
    }
    
    return aParameters_.copy;
}


-(void)addToHistory:(EMPlayItemInfo *)playItemInfo
{
    if (!playItemInfo) {
        return;
    }
    if ([self.historyList containsObject:playItemInfo]) {
        [self.historyList removeObject:playItemInfo];
    }
    
    if (self.historyList.count >= MaxHistoryCount) {
        [self.historyList removeLastObject];
    }
    [self willChangeValueForKey:@"historyList"];
    [self.historyList insertObject:playItemInfo atIndex:0];
    [self didChangeValueForKey:@"historyList"];
    
    [self persistence];
}

- (void)removeFromHistory:(EMPlayItemInfo *)playItemInfo
{
    if (!playItemInfo) {
        return;
    }
    if ([self.historyList containsObject:playItemInfo]) {
        [self willChangeValueForKey:@"historyList"];
        [self.historyList removeObject:playItemInfo];
        [self didChangeValueForKey:@"historyList"];
        
        [self persistence];
    }
}

-(void)removeAllHistory
{
    [self willChangeValueForKey:@"historyList"];
    [self.historyList removeAllObjects];
    [self didChangeValueForKey:@"historyList"];
    
    [self persistence];
}


@end
