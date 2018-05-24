//
//  EMFollowListViewModel.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/8.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMFollowListViewModel.h"
#import "EMFollowsManager.h"

@interface EMFollowListViewModel ()

@property (nonatomic, strong, readwrite) NSArray< EMPeakAnchor *> * dataArray;

@end

@implementation EMFollowListViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self fetchData];
    }
    return self;
}

-(void)fetchData
{
    self.dataArray = EMFollows.container.copy;
    [self.headerStatusCommand execute:@(kEMHeaderStatusEndRefresh)];
}


-(RACCommand *)followCommand
{
    if (!_followCommand) {
        _followCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(EMAnchor *input) {
            input.isFollowed = !input.isFollowed;
            if (input.isFollowed) {
                [EMFollows insertObj:input compareKey:@"uid"];
            }else{
                [EMFollows deleteObj:input compareKey:@"uid"];
            }
            return [RACSignal empty];
        }];
    }
    return _followCommand;
}

@end
