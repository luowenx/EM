//
//  EMPlayHistoryViewModel.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/4.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPlayHistoryViewModel.h"
#import "EMPlayViewModel.h"
#import "EMPlayHistoryManager.h"

@interface EMPlayHistoryViewModel ()
@property (nonatomic, strong, readwrite) NSArray<EMPlayItemInfo *> *dataArray;

@end

@implementation EMPlayHistoryViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        @weakify(self)
        [RACObserve(EMHistorys, historyList) subscribeNext:^(NSArray *x) {
            @strongify(self)
            self.dataArray = x.copy;
        }];
    }
    return self;
}

-(RACCommand *)playCommand
{
    if (!_playCommand) {
        _playCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(EMPlayItemInfo* input) {
            [[EMPlayViewModel shareInstance] playWithPlayItemInfo:input];
            return [RACSignal empty];
        }];
    }
    return _playCommand;
}

-(RACCommand *)removeCommand
{
    if (!_removeCommand) {
        _removeCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            [EMHistorys removeFromHistory:input];
            return [RACSignal empty];
        }];
    }
    return _removeCommand;
}

-(RACCommand *)removeAllCommand
{
    if (!_removeAllCommand) {
        _removeAllCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            [EMHistorys removeAllHistory];
            return [RACSignal empty];
        }];
    }
    return _removeAllCommand;
}

@end
