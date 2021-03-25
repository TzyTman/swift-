//
//  UIBezierPathTest_VC.m
//  SwfitTest
//
//  Created by fz on 2020/11/6.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

#import "UIBezierPathTest_VC.h"
#import "CustonView.h"
#import "Masonry.h"

@interface UIBezierPathTest_VC ()<CustonViewDelegate>

@property (nonatomic , strong)NSTimer *timer;
@property (nonatomic , assign)float index;
@property (nonatomic , strong) CustonView *showView;
@property (nonatomic , strong) UIView *biaojiView;
@end

@implementation UIBezierPathTest_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    CustonView *vi = [[CustonView alloc] init];
    vi.frame = CGRectMake(100, 100, 100, 50);
    vi.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:vi];
    
    //    [self LayerTest];
    //
    //    self.index = 0.1;
    //
    //    self.timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(timerEvent) userInfo:nil repeats:YES];
    //    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

//- (void)timerEvent {
//    
//    self.index+=0.01;
//    NSLog(@"%f",self.index);
//    self.showView.progress = self.index;
//    //setupProgress
//    if (self.index >=1) {
//        [self.timer invalidate];
//        self.timer = nil;
//    }
//}

#pragma mark --- CALayer
- (void)LayerTest {
    
    // CALayer *layer = [[CALayer alloc] init];
    //创建一个view
    //    //矩形带圆角
    //    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:25];
    //    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    //    maskLayer.frame = self.bounds;
    //    maskLayer.path = maskPath.CGPath;
    //    self.layer.mask = maskLayer;
    
    //    self.showView = [[CustonView alloc] initWithFrame:CGRectMake(100,200, 30, 300)];
    //    self.showView.backgroundColor = [UIColor blueColor];
    //    self.showView.delegate = self;
    //    self.showView.layer.masksToBounds = YES;
    //    self.showView.layer.cornerRadius = 30/2;
    //    [self.view addSubview:self.showView];
    //
    //    self.biaojiView = [[UIView alloc]init];
    //    self.biaojiView.backgroundColor = [UIColor blackColor];
    //    [self.view addSubview:self.biaojiView];
    
}

- (void)progressIcon:(CGFloat)y {
    
    NSLog(@"位置 %f", y);
    
    self.biaojiView.frame = CGRectMake(80, 160+y, 60, 40);
    
}


@end
