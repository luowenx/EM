//
//  MCAutoScrollView.m
//  MCStandard
//
//  Created by xtkj on 16/9/12.
//  Copyright © 2016年 michong. All rights reserved.
//

#import "MCSAutoScrollView.h"


//collection cell重用名
static NSString *kMCSCollectionViewCellIdentifier    = @"ImageCellIdentifier";

@interface MCSAutoScrollView () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong) UICollectionView *collection;

@property (nonatomic,strong) NSMutableArray   *dataSource;

@property (nonatomic,strong) NSTimer          *timer;

@end

@implementation MCSAutoScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI]; 
    }
    return self;
}

- (void)initUI
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing                  = 0;
    flowLayout.minimumInteritemSpacing             = 0;
    flowLayout.scrollDirection                     = UICollectionViewScrollDirectionHorizontal;
    
    _collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _collection.translatesAutoresizingMaskIntoConstraints = NO;
    [self.collection registerClass:[MCSImageCell class] forCellWithReuseIdentifier:kMCSCollectionViewCellIdentifier];
    self.collection.delegate                       = self;
    self.collection.dataSource                     = self;
    self.collection.pagingEnabled                  = YES;
    self.collection.scrollsToTop                   = NO;
    self.collection.bounces                        = NO;
    self.collection.showsHorizontalScrollIndicator = NO;
    self.collection.backgroundColor                = [UIColor whiteColor];
    [self addSubview:_collection];
    
    [self.collection autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.collection autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.collection autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self];
    [self.collection autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self];

    //pageController
    self.pageControl =  [UIPageControl newAutoLayoutView];
    self.pageControl.currentPage = 0;
    self.pageControl.userInteractionEnabled = NO;
    self.pageControl.hidesForSinglePage = YES;
    self.pageControl.pageIndicatorTintColor = [UIColor flsSpaceLineColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor flsMainColor];
    [self addSubview:self.pageControl];
    
    [self.pageControl autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.pageControl autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.pageControl autoSetDimension:ALDimensionHeight toSize:27];
    [self.pageControl autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self];
    
    self.closeBtn = [UIButton newAutoLayoutView];
    [self.closeBtn setHidden:YES];
//  [self.closeBtn setImageNormal:@""];
    [self addSubview:self.closeBtn];
    
    [self.closeBtn autoSetDimensionsToSize:CGSizeMake(40, 40)];
    [self.closeBtn autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.closeBtn autoPinEdgeToSuperviewEdge:ALEdgeRight];
}


#pragma mark -- NSTimer 定时器方法
- (void)timerShowImage
{
    [self.collection setContentOffset:CGPointMake(UIDeviceScreenWidth + self.collection.contentOffset.x, 0) animated:YES];
}

- (void)timerStart
{
    if (self.timer == nil && self.dataSource.count > 1) {
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:5.0f
                                                      target:self
                                                    selector:@selector(timerShowImage)
                                                    userInfo:nil
                                                     repeats:YES];
    }
    
}

- (void)timerfree
{
    if (self.timer) {
        
        [self.timer invalidate];
        
        self.timer = nil;
    }
}

#pragma  private
- (void)resetContOffset
{
    if (self.hidden) return;
    
    [self timerfree];
    
//    NSUInteger page = self.collection.contentOffset.x / kMCSUIDeviceScreenWidth;
    dispatch_async(dispatch_get_main_queue(), ^{
    [self.collection setContentOffset:CGPointMake(UIDeviceScreenWidth, 0)];
     });
    
    [self timerStart];
    
}

//刷新视图
- (void)reloadScrollData:(NSArray*)dataArray
{
    if (dataArray.count <= 0) {
        
        self.kMCSheightCons.constant = 0;
        
        return;
    }
    
    self.pageControl.numberOfPages  = dataArray.count;
    
    self.dataSource = [NSMutableArray arrayWithArray:dataArray];
    
    //大于两张才能滑动
    if (self.dataSource.count >= 2) {
    
        id  lastImage =  dataArray.lastObject;
        id  firstImage = dataArray.firstObject;
        
        //避免有闪现情况发生，所以在首尾分别插入最后一个和第一个
        [self.dataSource insertObject:lastImage atIndex:0];
        
        [self.dataSource insertObject:firstImage atIndex:self.dataSource.count];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.collection.contentOffset = CGPointMake(UIDeviceScreenWidth, 0);
       });
    }

    [self.collection reloadData];

    [self timerStart];
    
}

#pragma  mark  -- UIcolletionview dataSoure delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.frame.size;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MCSImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMCSCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.adImageView.contentMode = UIViewContentModeScaleToFill;
    
    NSAssert((self.delegate && [self.delegate respondsToSelector:@selector(autoScrollLoadImageCell:cellData:)]),@"未实现 MCAutoScrollLoadImageCell:cellData:");
    
    //load cell
    if (self.delegate && [self.delegate respondsToSelector:@selector(autoScrollLoadImageCell:cellData:)]) {
        [self.delegate autoScrollLoadImageCell:cell cellData:[self.dataSource objectAtIndex:indexPath.row]];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(autoScrollDidSelectItemWithData:)]) {
        [self.delegate autoScrollDidSelectItemWithData:[self.dataSource objectAtIndex:indexPath.row]];
    }
}

#pragma mark -- Scrollview代理方法
//动画开始
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDecelerating:scrollView];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self timerfree];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self timerStart];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSUInteger page = scrollView.contentOffset.x/scrollView.frame.size.width;
    
    self.pageControl.currentPage = page - 1;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offsex= scrollView.contentOffset.x;//获得偏移量
    if (offsex > scrollView.frame.size.width * self.pageControl.numberOfPages) {//判断偏移量
        
        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width, 0);
        
    }else if (offsex < scrollView.frame.size.width) {
        
        scrollView.contentOffset = CGPointMake(scrollView.frame.size.width * (self.pageControl.numberOfPages), 0);
    }
}

@end


