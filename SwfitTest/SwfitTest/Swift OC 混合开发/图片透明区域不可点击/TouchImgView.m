//
//  TouchImgView.m
//  SwfitTest
//
//  Created by fz on 2021/3/2.
//  Copyright © 2021 tuzhengyao. All rights reserved.
//

#import "TouchImgView.h"

@implementation TouchImgView

- (instancetype)initWithImage:(UIImage *)image {
    if (self = [super initWithImage:image]) {
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event {
    //返回矩形是否包含指定点
    if (!CGRectContainsPoint(self.bounds, point)) {
        return nil;
    }
    UIView *hitView = [super hitTest:point withEvent:event];
    CGFloat alpha = [self alphaOfPointFromViewScreenShot:point];
    if (alpha < 0.01f) {
        return nil;
    }
    return hitView;
}

// 截图，然后通过获取截图中的点击出的颜色来取得其 alpha 值。
- (CGFloat)alphaOfPointFromViewScreenShot:(CGPoint)point {
    UIImage *image = [self viewScreenShot];
    CGFloat alpha = [self alphaFromImage:image atX:point.x andY:point.y];
    return alpha;
}

- (UIImage *)viewScreenShot {
    UIGraphicsBeginImageContext(self.bounds.size);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (CGFloat)alphaFromImage:(UIImage*)image atX:(int)xx andY:(int)yy {
    // First get the image into your data buffer
    CGImageRef imageRef = [image CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    unsigned char *rawData = (unsigned char *)calloc(height * width * 4, sizeof(unsigned char));
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    CGContextRef context = CGBitmapContextCreate(rawData, width, height,
                                                 bitsPerComponent, bytesPerRow, colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    
    CGColorSpaceRelease(colorSpace);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);
    
    // Now your rawData contains the image data in the RGBA8888 pixel format.
    unsigned long byteIndex = (bytesPerRow * yy) + xx * bytesPerPixel;
    
    CGFloat alpha = (rawData[byteIndex + 3] * 1.0) / 255.0;
    free(rawData);
    return alpha;
}
@end
