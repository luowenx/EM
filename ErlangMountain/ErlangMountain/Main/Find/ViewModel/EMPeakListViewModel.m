//
//  EMPeakListViewModel.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/24.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMPeakListViewModel.h"
#import "EMPeakListReq.h"

@interface EMPeakListViewModel ()
@property (nonatomic, strong, readwrite) NSArray <EMFocuseImage *>*focusImages;
@property (nonatomic, strong, readwrite) NSArray <EMPeakGroupObj *>*dataArray;

@end

@implementation EMPeakListViewModel

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
    EMPeakListReq *req = [[EMPeakListReq alloc] init];
    [req requestWithCompletion:^(LQHttpResponse *response) {
        EMPeakListRes *res = (EMPeakListRes *)response;
        self.focusImages = [EMFocuseImage objArrayWithDics:res.focusImages[@"list"]];
        self.dataArray = [EMPeakGroupObj objArrayWithDics:res.datas];
        
        [self.headerStatusCommand execute:@(kEMHeaderStatusEndRefresh)];
    } error:^(LQHttpError *error) {

        [self.headerStatusCommand execute:@(kEMHeaderStatusEndRefresh)];
        [self.errorCommand execute:error];
    }];
}

@end
