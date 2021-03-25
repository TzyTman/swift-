//
//  Lock.m
//  SwfitTest
//
//  Created by fz on 2020/10/29.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

#import "Lock.h"
#import "Person.h"
#import <pthread/pthread.h>

@interface Lock ()

@end

@implementation Lock

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //    [self withoutLock];
    //    [self synchronizedTest];
    [self ptheadNormalTest];
}

- (void)withoutLock {
    
    __block  Person *p = [Person  new];
    
    NSLock *lock = [[NSLock alloc] init]; //加锁
    
    [NSThread detachNewThreadWithBlock:^{
        
        for (int i = 0; i< 1000; i++) {
            [lock lock];
            p.age++;
            [lock unlock];
        }
        NSLog(@"%ld \n",p.age);
        
    }];
    
    
    [NSThread detachNewThreadWithBlock:^{
        for (int i = 0; i< 1000; i++) {
            [lock lock];
            p.age++;
            [lock unlock];
        }
        NSLog(@"%ld \n",p.age);
    }];
    
}

- (void)synchronizedTest {
    
    __block  Person *p = [Person  new];
    
    [NSThread detachNewThreadWithBlock:^{
        
        for (int i = 0; i< 1000; i++) {
            @synchronized (p) { //加锁
                p.age++;
            }
        }
        NSLog(@"%ld \n",p.age);
        
    }];
    
    
    [NSThread detachNewThreadWithBlock:^{
        for (int i = 0; i< 1000; i++) {
            @synchronized (p) { //加锁
                p.age++;
            }
        }
        NSLog(@"%ld \n",p.age);
    }];
}

/**
 pthread 的全称是POSIX thread 是一套跨平台的多线程API,各个平台对其都有实现。pthread 是一套非常强大的多线程锁，可以创建
 互斥锁 ，递归锁 ，信号量，条件锁，读写锁，once锁等，基本上所有涉及的锁，都可以用pthread来实现
 */


/// 互斥锁
- (void)ptheadNormalTest {
    
    __block Person *p = [[Person alloc] init];
    
    NSLog(@"begin");
    
    __block pthread_mutex_t t;
    
    pthread_mutex_init(&t,NULL);
    
    [NSThread detachNewThreadWithBlock:^{
        
        for (int i = 0; i< 1000; i++) {
            pthread_mutex_lock(&t);
            p.age++;
            pthread_mutex_unlock(&t);
        }
        NSLog(@"% zd \n",p.age);
    }];
    
    [NSThread detachNewThreadWithBlock:^{
        
        for (int i = 0; i< 1000; i++) {
            pthread_mutex_lock(&t);
            p.age++;
            pthread_mutex_unlock(&t);
        }
        NSLog(@"% zd \n",p.age);
    }];
    
    pthread_mutex_destroy(&t);
}

//递归锁



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
