//
//  CustonView.m
//  SwfitTest
//
//  Created by fz on 2020/11/6.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

#import "CustonView.h"

@implementation CustonView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)drawRect:(CGRect)rect {
    
//    NSLog(@"self.progressY %f",self.progressY);
        //椭圆
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = self.bounds;
        maskLayer.path = path.CGPath;
        self.layer.mask = maskLayer;
    ////    [path stroke];
    
    //    //矩形带圆角
    //    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:25];
    //    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    //    maskLayer.frame = self.bounds;
    //    maskLayer.path = maskPath.CGPath;
    //    self.layer.mask = maskLayer;
    
    //自定义不对称圆角
    //    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(25, 25)];
    //    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    //    maskLayer.frame = self.bounds;
    //    maskLayer.path = maskPath.CGPath;
    //    self.layer.mask = maskLayer;
    
    
//    //正方形
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(rect.origin.x, rect.origin.y + self.progressY, rect.size.width, rect.size.height)];
//    [[UIColor whiteColor] set];
//    CGFloat lineWidthS = 30;
//    if (self.progress>=1) {
//        lineWidthS = 0.0;
//    }
//    path.lineWidth = lineWidthS;
//    [path stroke];
    
    //    //bezier曲线 画圆
    //
    //    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2.f,self.bounds.size.height/2.f)radius:self.bounds.size.width/2.f startAngle:0 endAngle:M_PI *2*self.progress clockwise:YES];
    //
    //    //创建一个shapeLayer
    //    CAShapeLayer *layer = [CAShapeLayer layer];
    //    layer.frame = self.bounds;
    //    layer.path = path.CGPath;                         //从bezier曲线获取到的形状
    //    layer.strokeColor = [UIColor greenColor].CGColor; //边缘线的颜色
    //    layer.fillColor = [UIColor clearColor].CGColor;   //闭环填充的颜色
    //    layer.lineCap = kCALineCapSquare;                  //边缘线的类型
    //    layer.lineWidth = 4.0f;                            //线条宽度
    //    //    layer.strokeStart = 0.0f;
    //    //    layer.strokeEnd = 0.0f;
    //    //    self.layer.mask = layer;
    //    //    [path stroke];
    //    //    //将layer添加进图层
    //    [self.layer addSublayer:layer];
    
    //    //
    //    //给这个layer添加动画效果
    //
    //    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //
    //    pathAnimation.duration = 3;
    //
    //    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    //
    //    pathAnimation.toValue = [NSNumber numberWithFloat:1.f];
    //
    //    //使视图保留到最新状态
    //    pathAnimation.removedOnCompletion = NO;
    //
    //    pathAnimation.fillMode = kCAFillModeForwards;
    //
    //    [layer addAnimation:pathAnimation forKey:nil];
}

//- (void)setProgress:(CGFloat)progress {
//    _progress = progress;
//    self.progressY = self.frame.size.height*_progress;
//    [self setNeedsDisplay];
//
//    if ([self.delegate respondsToSelector:@selector(progressIcon:)]) {
//        [self.delegate progressIcon:self.progressY];
//    }
//}

@end
