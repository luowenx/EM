//
//  EMCollectionListViewModel.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/5/10.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMCollectionListViewModel.h"
#import "EMAlbumManager.h"

@interface EMCollectionListViewModel ()

@property (nonatomic, strong, readwrite) NSArray<EMAlbumBaseInfo *> * dataArray;

@end
@implementation EMCollectionListViewModel

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
    self.dataArray = EMAlbums.container.copy;
    [self.headerStatusCommand execute:@(kEMHeaderStatusEndRefresh)];
}
@end
