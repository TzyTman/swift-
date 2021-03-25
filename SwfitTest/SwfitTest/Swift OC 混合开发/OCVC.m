//
//  OCVC.m
//  SwfitTest
//
//  Created by mac on 2020/6/10.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

#import "OCVC.h"
//#import <Lottie/Lottie.h>
//#import <pop/POP.h>
//#import "YYWebImage.h"
#import <YYImage/YYImage.h>
#import "YYImage.h"
#import <SDWebImage/SDWebImage.h>
#import <SDWebImage/SDImageGIFCoder.h>
#import "TouchImgView.h"
//状态栏height
#define STATUS_BAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏的高度
#define NAV_BAR_HEIGHT (STATUS_BAR_HEIGHT + 44)
//底部安全区域的大小
#define BOTTOM_SAFE_AREA (STATUS_BAR_HEIGHT > 20 ? 34 : 0)


@interface OCVC ()<CAAnimationDelegate>

@property(nonatomic , assign)BOOL isStop;
@property(nonatomic , strong)UIButton *button;
//@property(nonatomic , strong)LOTAnimationView *animationView;
@property(nonatomic , strong)UIView *view1;
@property (nonatomic , assign)NSInteger index;
@end

@implementation OCVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor blueColor];
    self.index == 0;
    
    //    NSString *gifPath = [[NSBundle mainBundle] pathForResource:@"voice" ofType:@"gif"];
    //    NSData *gifData = [NSData dataWithContentsOfFile:gifPath];
    //
    //    UIImageView *imageView = [[UIImageView alloc] init];
    //    imageView.frame = CGRectMake(100, 100, 50, 50);
    //    [imageView setImage:[UIImage sd_imageWithGIFData:gifData]];
    //    [self.view addSubview:imageView];
    
    //    YYAnimatedImageView *gifView = [[YYAnimatedImageView alloc] initWithImage:[YYImage imageNamed:@"voice"]];
    //    gifView.frame = CGRectMake(100, 100, 50, 50);
    //    [self.view addSubview:gifView];
    
    //    /**
    //     frame：描述当前视图在其父视图中的位置和大小。
    //     bounds：描述当前视图在其自身坐标系统中的位置和大小。
    //     center：描述当前视图的中心点在其父视图中的位置。
    //     */
    //    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    //    //    view.bounds = CGRectMake(-50, -10, 100, 100); //改变父视图原有坐标系
    //    view.backgroundColor = [UIColor yellowColor];
    //    [self.view addSubview:view];
    
    //    self.view1 = [[UIView alloc] initWithFrame:CGRectMake(30, 200, 160, 60)];
    //    self.view1.backgroundColor = [UIColor blueColor];
    //    [self.view addSubview:self.view1];
    //
    //    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    //    self.button.frame = CGRectMake(0, 100, 50, 50);
    //    self.button.backgroundColor = [UIColor blueColor];
    //    [self.button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:self.button];
    //    self.button.center = CGPointMake(25, 25);
    
    //    [self bgAnimationView];
    
    //2 多线程操作
    //    [self operationTest];
    // [NSThread detachNewThreadSelector:@selector(useInvocationOperation) toTarget:self withObject:nil]; //在其它线程中执行
    
    //    CGRect frame = self.view.frame;
    //    NSLog(@"self.view - frame - %@", NSStringFromCGRect(frame));
    //
    //    CGRect layoutFrame = self.view.safeAreaLayoutGuide.layoutFrame;
    //    NSLog(@"self.view - layoutFrame - %@", NSStringFromCGRect(layoutFrame));
    //
    //    UIEdgeInsets insets = self.view.safeAreaInsets;
    //    NSLog(@"self.view - insets - %@", NSStringFromUIEdgeInsets(insets));
    
//    [self LayerTest];
    
//    NSSet *set1 = [[NSSet alloc] initWithObjects:@"3",@"0",@"1",@"2", nil];
//    for (NSString *string in set1) {
//        NSLog(@"%@",string);
//    }
    
    [self setupTouchImageView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    //    CGRect frame = self.view.frame;
    //
    //    NSLog(@"self.view - frame - %@", NSStringFromCGRect(frame));
    //
    //    CGRect layoutFrame = self.view.safeAreaLayoutGuide.layoutFrame;
    //
    //    NSLog(@"self.view - layoutFrame - %@",NSStringFromCGRect(layoutFrame));
    //
    //    UIEdgeInsets insets = self.view.safeAreaInsets; //top, left, bottom, right;
    //    NSLog(@"self.view - insets - %@" , NSStringFromUIEdgeInsets(insets));
    
}

- (void)click:(id)sender {
    
    NSLog(@"点击事件");
    [self createAnimaition];
}


- (void)createAnimaition{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    animation.repeatCount = 3;
    animation.duration = 0.5;
    animation.delegate = self;
    
    animation.values = @[@(0),@(M_PI_4/4),@(0),@(-((M_PI_4/4))),@(0)];
    
    //    animation.keyTimes = @[@(0), @(1)];
    
    //    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    [self.view1.layer addAnimation:animation forKey:@"kViewShakerAnimationKey"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if ([self.view1.layer animationForKey:@"kViewShakerAnimationKey"] == anim) {
        NSLog(@"结束");
    }
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    
    //[self.view bringSubviewToFront:self.button];
}


- (void)bgAnimationView  {
    //    self.animationView = [LOTAnimationView animationNamed:@"mermaid_bg"];
    //    self.animationView.frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height);
    //    [self.view addSubview:self.animationView];
    //    [self.animationView setLoopAnimation:YES];
    //    [self.animationView play];
}

- (void)dealloc {}

#pragma mark ------- 2 多线程操作
/**
 NSOperation 是抽象类 不能用来封装操作 我们只能使用它的子类来进行封装操作
 1. NSInvocationOperation
 */
- (void)operationTest {
    [self useInvocationOperation];
}

/// 使用子类 NSInvaocationOperation
- (void)useInvocationOperation {
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task1) object:nil];
    [op start];
}

- (void)task1 {
    for (int i = 0; i<2; i++) {
        [NSThread sleepForTimeInterval:2]; //模拟耗时
        NSLog(@"打印当前线程 %@",[NSThread currentThread]);
    }
}


#pragma mark --- 图片透明区域不可点击
- (void)setupTouchImageView {
    
    TouchImgView *touchImgView = [[TouchImgView alloc] initWithImage:[UIImage imageNamed:@"login"]];
    touchImgView.frame = CGRectMake(100, 30, 100, 80);
//    touchImgView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:touchImgView];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchImgView:)];
    tapGesture.numberOfTapsRequired = 1;
    [touchImgView addGestureRecognizer:tapGesture];
}

- (void)touchImgView:(UITapGestureRecognizer *)gesture{
    NSLog(@"响应图片手势点击事件%ld",self.index++);
}

@end
