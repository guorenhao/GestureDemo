//
//  TapViewController.m
//  GestureDemo
//
//  Created by 郭人豪 on 2017/5/21.
//  Copyright © 2017年 Abner_G. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test];
}

- (void)test {
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
    imageView.center = self.view.center;
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:@"c001"];
    [self.view addSubview:imageView];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
    [imageView addGestureRecognizer:tap];
}

- (void)tapImage:(UITapGestureRecognizer *)tap {
    
    UIImageView * imageView = (UIImageView *)tap.view;
    
    static int flag = 0;
    flag ^= 1;
    if (flag) {
        
        imageView.frame = CGRectMake(0, 0, 300, 200);
        NSLog(@"点击了图片放大！");
    } else {
        
        imageView.frame = CGRectMake(0, 0, 150, 100);
        NSLog(@"点击了图片缩小！");
    }
    imageView.center = self.view.center;
    
}

@end
