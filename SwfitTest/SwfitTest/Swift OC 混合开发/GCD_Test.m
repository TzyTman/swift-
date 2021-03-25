//
//  GCD_Test.m
//  SwfitTest
//
//  Created by fz on 2020/10/10.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

#import "GCD_Test.h"
@interface GCD_Test ()
@end

/**
 1.1 什么是GCD
 Crand Central Dispatch (GCD)是异步执行任务技术之一
 */
@implementation GCD_Test

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    dispatch_queue_t queue = dispatch_queue_create("com.example.gcd.MyserialDispatchQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        
        NSLog(@"currentThread %@", [NSThread currentThread]);
    });
}

@end
