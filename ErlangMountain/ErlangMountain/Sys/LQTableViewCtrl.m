//
//  LQTableViewCtrl.m
//
//  Created by lequwuxian1 on 2017/12/21.
//  Copyright © 2017年 lequwuxian. All rights reserved.
//

#import "LQTableViewCtrl.h"

@interface LQTableViewCtrl ()

@end

@implementation LQTableViewCtrl
@synthesize dataList = dataList_;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    dataList_ = [[NSMutableArray alloc]initWithCapacity:0];
    _tableView = [UITableView newAutoLayoutView];
    [_tableView setBackgroundColor:[UIColor whiteColor]];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    if (@available(iOS 11.0, *)) {
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    [self.view addSubview:_tableView];
    [self initTableConstraints];
    [_tableView setNeedsLayout];
    [_tableView layoutIfNeeded];
    
    [self initDelegate];
}

- (void)initTableConstraints
{
    [_tableView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_tableView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_tableView autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:_tableView.superview ];
    [_tableView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:_tableView.superview];
}

-(void)initDelegate
{
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

-(void)headerWith:(EMHeaderCommendStatus)commendStatus
{
    switch (commendStatus) {
        case kEMHeaderStatusEndRefresh:{
            [self.tableView.mj_header endRefreshing];
            break;
        }
            case kEMHeaderStatusNone:
            case kEMHeaderStatusRefreshing:
            
        default:
            break;
    }
}

-(void)footerWith:(EMFooterCommendStatus)commendStatus
{
    switch (commendStatus) {
        case kEMFooterStatusNone:
        case kEMFooterStatusRefreshing:
            
            break;
        case kEMFooterStatusEndRefresh:{
            [self.tableView.mj_footer endRefreshing];
            break;
        }
        case kEMFooterStatusNoMoreData:{
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
            break;
        }
        case kEMFooterStatusReSet:{
            [self.tableView.mj_footer resetNoMoreData];
            break;
        }
        
        default:
            break;
    }
}

#pragma mark UITableViewDataSource<NSObject>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataList_.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


@end
