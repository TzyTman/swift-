//
//  block.m
//  SwfitTest
//
//  Created by tuzhengyao on 2020/6/14.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

#import "block.h"

@implementation block

int main () {
    
    void (^myBlock)(void) = ^{
        printf("myBlock\n");
    };
    myBlock();

    return 0;
}

@end
