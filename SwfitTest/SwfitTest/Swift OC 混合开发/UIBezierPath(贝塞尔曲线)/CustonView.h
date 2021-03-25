//
//  CustonView.h
//  SwfitTest
//
//  Created by fz on 2020/11/6.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CustonViewDelegate <NSObject>

- (void)progressIcon:(CGFloat)y;

@end

@interface CustonView : UIView
/// 进度（值范围0.0~1.0，默认0.0）
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) CGFloat progressY;
@property (nonatomic, weak) id <CustonViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
