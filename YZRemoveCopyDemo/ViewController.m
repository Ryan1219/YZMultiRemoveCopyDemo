//
//  ViewController.m
//  YZRemoveCopyDemo
//
//  Created by zhangliangwang on 17/5/8.
//  Copyright © 2017年 zhangliangwang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self removeCopy];
    [self removeMultiCopy];
}

//MARK:- 去掉一串字符串的重复字符，只是保留一个
- (void)removeMultiCopy {
    
    NSString *str = @"aabdffccabdeacg";
    NSMutableString *newString = [[NSMutableString alloc] init];
    for (int i = 0; i < str.length; i++) {
        unsigned char a = [str characterAtIndex:i];
        if ([newString containsString:[NSString stringWithFormat:@"%c",a]] == false) {
            [newString appendString:[NSString stringWithFormat:@"%c",a]];
        } else {
            NSLog(@"--had containted--");
        }
    }
    NSLog(@"----%@",newString);
   
}

//MARK:- 去除字符串中不相连的重复字符，如aabcad 去除后为 aabcd
- (void)removeCopy {
    
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"aabcca"];
    for (int i = 0; i < str.length-1; i++) {
        for (int j = i + 1; j < str.length; j++) {
            
            unsigned char a = [str characterAtIndex:i];
            unsigned char b = [str characterAtIndex:j];
            
            if (a == b) {
                if (j - i > 1) {
                    NSRange range = {j,1};
                    [str deleteCharactersInRange:range];
                    j = i--;
                }
            }
        }
    }
    NSLog(@"----%@",str);
}

@end






































































