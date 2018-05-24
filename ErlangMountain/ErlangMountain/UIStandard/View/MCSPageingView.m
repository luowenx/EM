//
//  MCSPageingView.m
//  haochang
//
//  Created by luowenx on 16/9/12.
//  Copyright © 2016年 Administrator. All rights reserved.
//

#import "MCSPageingView.h"

@interface MCSPageingView ()

/**
 *  标题数组
 */
@property (nonatomic, strong) NSArray<NSString*>* titles;

/**
 *  当前选中下标
 */
@property (nonatomic, assign) NSUInteger currentIndex;

@property (nonatomic, strong) NSMutableArray<UIButton*>* titleButtons;
// 可滑动的视图
@property (nonatomic, strong) UIView* bottomLineContentView;

@property (nonatomic, strong) NSLayoutConstraint* bootomLineLeftLayoutConstraint;
@end

@implementation MCSPageingView
- (instancetype)initWithTitles:(NSArray<NSString*>*)titles
{
    self = [super init];
    if (self) {
        self.animationAllow = YES;
        UIView* lineView = [[UIView alloc] initForAutoLayout];
        [self addSubview:lineView];
        lineView.backgroundColor = UIColorFromRGB(0xf2f2f2);
        [lineView autoSetDimension:(ALDimensionHeight) toSize:.5];
        [lineView autoPinEdgesToSuperviewEdgesWithInsets:(UIEdgeInsetsMake(0, 0, 0, 0)) excludingEdge:(ALEdgeTop)];
        
        self.bottomLineContentView = [UIView newAutoLayoutView];
        
        if (titles.count > 0) {
            [self addSubview:self.bottomLineContentView];
            [self.bottomLineContentView autoMatchDimension:(ALDimensionWidth) toDimension:(ALDimensionWidth) ofView:self withMultiplier:1.0 / titles.count];
            [self.bottomLineContentView autoPinEdgeToSuperviewEdge:(ALEdgeBottom)];
            self.bootomLineLeftLayoutConstraint = [self.bottomLineContentView autoPinEdgeToSuperviewEdge:(ALEdgeLeft)];
            [self.bottomLineContentView autoSetDimension:(ALDimensionHeight) toSize:2];
            self.bottomLineContentView.backgroundColor = [UIColor flsMainColor];
        }
        
        self.titleButtons = [[NSMutableArray alloc] init];
        self.titles = titles;
        [self initTitleButtons];

    }
    return self;
}

- (instancetype)initWithTitles:(NSArray<NSString*>*)titles selectBlock:(MCSPageingSelectBlock)block
{
    self = [self initWithTitles:titles];
    if (self) {
        self.selectBlock = block;
    }
    return self;
}

- (instancetype)initWithTitles:(NSArray<NSString*>*)titles selectDelegate:(id<MCSPageingViewSelectDelegate>)delegate
{
    self = [self initWithTitles:titles];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (void)resetTitle:(NSUInteger)index title:(NSString*)title
{
    if (index >= self.titleButtons.count) {
        return;
    }
    [self.titleButtons[index] setTitle:title forState:(UIControlStateNormal)];
    self.titles = [self.titleButtons valueForKeyPath:@"titleLabel.text"];
}

- (void)selectIndex:(NSUInteger)index
{
    if (index == self.currentIndex) {
        return;
    }
    self.currentIndex = index;
    [self update:index];
}

- (void)setCurrentIndex:(NSUInteger)currentIndex
{
    if (currentIndex == _currentIndex) {
        return;
    }
    BOOL flag = NO;
    if (self.selectBlock && !self.selectBlock(self, currentIndex)) {
        flag = YES;
    }
    if ([self.delegate respondsToSelector:@selector(didSelectPage:index:)] && ![self.delegate didSelectPage:self index:currentIndex]) {
        flag = YES;
    }
    if (flag) {
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self update:currentIndex];

    });
//    [self update:currentIndex];
}

- (void)update:(NSUInteger)currentIndex
{
    _currentIndex = currentIndex;
    [self layoutIfNeeded];
    __weak typeof(self) weakSelf = self;
    void (^block)(void) = ^() {
        [weakSelf.titleButtons enumerateObjectsUsingBlock:^(UIButton* _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
            
            [obj setTitleColor:idx == self.currentIndex ? [UIColor flsMainColor] : [UIColor blackColor] forState:(UIControlStateNormal)];
        }];
        
        if (weakSelf.titles.count > 0) {
            self.bootomLineLeftLayoutConstraint.constant = self.currentIndex * (self.frame.size.width / self.titles.count);
        }
        // 解决某个bug 注释掉了这俩句话，不知道会不会出其他bug
//        [self updateConstraintsIfNeeded];
//        [self layoutIfNeeded];
    };
    if (self.animationAllow) {
        [UIView animateWithDuration:.3 animations:^{
            block();
        }];
    }
    else {
        block();
    }
}

- (void)initTitleButtons
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self autoSetDimension:(ALDimensionHeight) toSize:kMCSPageingViewSizeHeight];
    self.backgroundColor = [UIColor whiteColor];
    __block UIButton* lastBtn;
//    @weakify(self);
    __weak typeof(self) weakSelf = self;
    [self.titles enumerateObjectsUsingBlock:^(NSString* _Nonnull obj, NSUInteger idx, BOOL* _Nonnull stop) {
//        @strongify(self);
        UIButton* btn = [[UIButton alloc] initForAutoLayout];
        [btn setTitle:obj forState:(UIControlStateNormal)];
        btn.titleLabel.font = [UIFont lqsFontOfSize:28];
        [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        
        btn.tag = idx + 999;
//        btn.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal*(UIButton* input) {
//            self.currentIndex = input.tag - 999;
        
//            return [RACSignal empty];
//        }];
        [btn addTarget:self action:@selector(itemBtnAction:) forControlEvents:UIControlEventTouchUpInside];

        if (idx == weakSelf.currentIndex) {
            [btn setTitleColor:[UIColor flsMainColor] forState:(UIControlStateNormal)];
        }
        
        [self addSubview:btn];

        if (idx == 0) {
            [btn autoPinEdgeToSuperviewEdge:(ALEdgeLeft)];
        }
        if (idx + 1 == self.titles.count) {
            [btn autoPinEdgeToSuperviewEdge:(ALEdgeRight)];
        }else{
            UIView *line  = [UIView newAutoLayoutView];
            line.backgroundColor =UIColorFromRGB(0xf2f2f2);
            [btn addSubview:line];
            [line autoPinEdgeToSuperviewEdge:ALEdgeRight];
            [line autoSetDimensionsToSize:CGSizeMake(.5, 12)];
            [line autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        }
        
        if (lastBtn) {
            [btn autoPinEdge:(ALEdgeLeft) toEdge:(ALEdgeRight) ofView:lastBtn];
        }
        [btn autoPinEdgeToSuperviewEdge:(ALEdgeTop)];
        [btn autoPinEdgeToSuperviewEdge:(ALEdgeBottom)];
        
        lastBtn = btn;
        [weakSelf.titleButtons addObject:btn];
    }];
    
    [self.titleButtons autoMatchViewsDimension:(ALDimensionWidth)];
}

- (void) itemBtnAction:(UIButton *)btn
{
    self.currentIndex = btn.tag - 999;
}


-(UIButton *)itemAtIdex:(NSUInteger)index
{
    for (UIButton *operableBtn in self.subviews) {
        if (operableBtn.tag == index + 999) {
            return operableBtn;
        }
    }
    return nil;
}


@end
