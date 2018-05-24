//
//  EMTabarCenterItem.m
//  ErlangMountain
//
//  Created by lequwuxian1 on 2018/4/16.
//  Copyright © 2018年 luowenx. All rights reserved.
//

#import "EMTabarCenterItem.h"

@interface EMTabarCenterItem ()

@property (nonatomic, strong) UIButton *centerButton;

@property (nonatomic, strong) UIImageView *rotateImageView;

@property (nonatomic, strong) RACDisposable *disposable;
@property (nonatomic) NSInteger aFrame;

@end

@implementation EMTabarCenterItem

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat itemWidth = UIDeviceScreenWidth * 0.2; //  五分之一的屏幕宽度
        CGFloat itemHeight = itemWidth + (is_iPhoneX ? 34 : 0);
        [self autoSetDimensionsToSize:CGSizeMake(itemWidth, itemHeight)];
        
        _centerButton = [UIButton newAutoLayoutView];
        _centerButton.backgroundColor = [UIColor redColor];
        [_centerButton roundedRectWith:itemWidth * .4];
        [_centerButton setImage:imageWithName(@"tabar_center") forState:(UIControlStateNormal)];
        [self addSubview:_centerButton];
        [_centerButton autoSetDimensionsToSize:CGSizeMake(itemWidth * .8, itemWidth * .8)];
        [_centerButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
        [_centerButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
        
        _rotateImageView = [UIImageView newAutoLayoutView];
        [_rotateImageView roundedRectWith:itemWidth * .4];
        [self addSubview:_rotateImageView];
        [_rotateImageView autoAlignAxis:ALAxisVertical toSameAxisOfView:_centerButton];
        [_rotateImageView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_centerButton];
        [_rotateImageView autoSetDimensionsToSize:CGSizeMake(itemWidth * .8, itemWidth * .8)];

        @weakify(self)
        [[_centerButton rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
            if (self_weak_.action) {
                self_weak_.action();
            }
        }];
    }
    return self;
}

-(void)setImageWithName:(NSString *)name url:(NSString *)urlString
{
    if (name.length > 0) {
        _rotateImageView.image = imageWithName(name);
    }else {
        [_rotateImageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
    }
}

-(void)start
{
    if (_disposable && !_disposable.isDisposed) {
        return;
    }
    
    self.aFrame = 0;
    @weakify(self)
    _disposable = [[RACSignal interval:.1 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(id x) {
        self_weak_.rotateImageView.transform = CGAffineTransformMakeRotation(self_weak_.aFrame * M_PI/90);
        self_weak_.aFrame++;
    }];
}

-(void)pause
{
    if (_disposable && !_disposable.isDisposed) {
        [_disposable dispose];
        _disposable = nil;
        return;
    }
    
    @weakify(self)
    _disposable = [[RACSignal interval:.1 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(id x) {
        self_weak_.rotateImageView.transform = CGAffineTransformMakeRotation(self_weak_.aFrame * M_PI/90);
        self_weak_.aFrame++;
    }];
}

-(void)stop
{
    [_disposable dispose];
    _disposable = nil;
    self.aFrame = 0;
    _rotateImageView.image = nil;
}

-(void)dealloc
{
    [self stop];
}

-(void)setAFrame:(NSInteger)aFrame
{
    if (aFrame >= 360) {
        aFrame = 0;
    }
    _aFrame = aFrame;
}

@end
