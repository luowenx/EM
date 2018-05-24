//
//  LQBaseViewCtrl.m
//
//  Created by lequwuxian1 on 2017/12/8.
//  Copyright © 2017年 lequwuxian. All rights reserved.
//

#import "LQBaseViewCtrl.h"

@interface LQBaseViewCtrl ()
@property (nonatomic, readwrite) BOOL viewAppear;

@end

@implementation LQBaseViewCtrl
{
    UIView *placeholderView_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationBarHidden = NO;
    [self setNavigationBar];

    @weakify(self)
    [self addLeftNavWithImageName:@"public_back" hander:^{
        [self_weak_ onBack];
    }];
    
    [self initUI];
    [self initViewModel];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.viewAppear = YES;
    self.navigationController.navigationBar.hidden = self.navigationBarHidden;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.viewAppear = NO;
}


-(void)dealloc
{
    NSLog(@"%@ did dealloc!", NSStringFromClass([self class]));
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)setNavigationBar
{
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    self.navigationBarStyle = LQNavigationBarTypeWhite;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
}

-(void)setNavigationBarStyle:(LQNavigationBarType)navigationBarStyle
{
    _navigationBarStyle = navigationBarStyle;
    switch (navigationBarStyle) {
        case LQNavigationBarTypeRed:{
//            self.navigationController.navigationBar.barTintColor = [UIColor flsMainColor];
            self.navigationController.navigationBar.translucent = NO;
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]/*,NSFontAttributeName:[UIFont systemFontOfSize:25]*/}];
        }
            break;
        case LQNavigationBarTypeBlack:{
            self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
            self.navigationController.navigationBar.translucent = NO;
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]/*,NSFontAttributeName:[UIFont systemFontOfSize:25]*/}];
            break;
        }
        case LQNavigationBarTypeWhite:{
            self.navigationController.navigationBar.translucent = NO;
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]/*,NSFontAttributeName:[UIFont systemFontOfSize:25]*/}];
            break;
        }
        default:
            break;
    }
}


- (void)initUI
{
    //...over write
}

- (void)initViewModel
{
    //...over write
}

@end


@implementation LQBaseViewCtrl(Navigation)

-(UIButton *)createItem
{
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    
    
    return button;
}

-(UIButton *)addLeftNavWithTitle:(NSString *)leftTitle hander:(void(^)(void))hander
{
    if (leftTitle.length<=0) {
        self.navigationItem.leftBarButtonItem = nil;
        return nil;
    }
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGFloat titleWidth = [leftTitle sizeWithFont:leftBtn.titleLabel.font byWidth:1000].width + 4;
    
    leftBtn.frame = CGRectMake(0, 0, titleWidth, 30);
    leftBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [leftBtn setTitle:leftTitle forState:(UIControlStateNormal)];
//    [leftBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, leftBtn.frame.size.width - titleWidth +2)];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [[leftBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
        if (hander) {hander();}
    }];
    
    return leftBtn;
}

-(UIButton *)addLeftNavWithImageName:(NSString *)leftImage hander:(void(^)(void))hander
{
    if (leftImage.length<=0) {
        self.navigationItem.leftBarButtonItem = nil;
        return nil;
    }
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 44, 44);
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(12, 0, 12, 32);
    leftBtn.backgroundColor = [UIColor clearColor];
    [leftBtn setImage:imageWithName(leftImage) forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;

    [[leftBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
        if (hander) {hander();}
    }];
    
    return leftBtn;
}

-(UIButton *)addRightNavWithTitle:(NSString *)rightTitle hander:(void(^)(void))hander
{
    if (rightTitle.length<=0) {
        self.navigationItem.leftBarButtonItem = nil;
    }
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.titleLabel.font = [UIFont emFontSmall];
    CGFloat titleWidth = [rightTitle sizeWithFont:rightBtn.titleLabel.font byWidth:1000].width + 4;
    rightBtn.frame = CGRectMake(0, 0, titleWidth, 30);
    rightBtn.backgroundColor = [UIColor clearColor];
    rightBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [rightBtn setTitle:rightTitle forState:(UIControlStateNormal)];
    [rightBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    UIBarButtonItem *leftSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    leftSpacer.width = -15;
    self.navigationItem.rightBarButtonItems = @[leftItem, leftSpacer];
    
    [[rightBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
        if (hander) {hander();}
    }];
    
    return rightBtn;
}

-(UIButton *)addRightNavWithImageName:(NSString *)rightImage hander:(void(^)(void))hander
{
    if (rightImage.length<=0) {
        self.navigationItem.leftBarButtonItem = nil;
    }
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    rightBtn.backgroundColor = [UIColor clearColor];
    [rightBtn setBackgroundImage:imageWithName(rightImage) forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    UIBarButtonItem *leftSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    leftSpacer.width = -15;
    self.navigationItem.rightBarButtonItems = @[leftItem,leftSpacer];
    
    [[rightBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(id x) {
        if (hander) {hander();}
    }];
    
    return rightBtn;
}

-(void)onBack
{
    if (!self.navigationController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    if (self.navigationController.viewControllers.count <= 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end


@implementation LQBaseViewCtrl(Tips)

-(UIView *)showEmptyViewInView:(UIView *)superView imageName:(NSString *)imageName title:(NSString *)title
{
    if (!superView) {
        return nil;
    }
    [self hiddenEmptyView];
    
    placeholderView_ = [UIView newAutoLayoutView];
    [superView addSubview:placeholderView_];
    [placeholderView_ autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    
    UIImageView *imageView = [UIImageView newAutoLayoutView];
    imageView.image = imageWithName(imageName);
    [placeholderView_ addSubview:imageView];
    [imageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [imageView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:placeholderView_ withOffset:-15];
    [imageView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    
    UILabel *titleLabel = [UILabel newAutoLayoutView];
    titleLabel.text = title;
    titleLabel.font = [UIFont lqsFontOfSize:30];
    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.textColor = UIColorFromRGB(0xb2b2b2);
    [placeholderView_ addSubview:titleLabel];
    [titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15];
    [titleLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:imageView];
    
    @weakify(self)
    [placeholderView_ addTapGestureWithBlock:^(UIView *gestureView) {
        [self_weak_ reloadEmptyView];
    }];
    
    return placeholderView_;
}

-(UIView *)showEmptyViewImageName:(NSString *)imageName title:(NSString *)title
{
    return [self showEmptyViewInView:self.view imageName:imageName title:title];
}

-(UIView *)showEmptyViewInView:(UIView *)superView imageName:(NSString *)imageName
{
    return [self showEmptyViewInView:superView imageName:imageName title:nil];
}

-(UIView *)showEmptyViewInView:(UIView *)superView
{
    return [self showEmptyViewInView:superView imageName:@"empty_3"];
}

-(UIView *)showEmptyView
{
    return [self showEmptyViewInView:self.view imageName:@"empty_3"];
}

- (void)hiddenEmptyView
{
    if (placeholderView_) {
        [placeholderView_ removeFromSuperview];
        placeholderView_ = nil;
    }
}

- (void)reloadEmptyView
{
    [self hiddenEmptyView];
    
}

@end

