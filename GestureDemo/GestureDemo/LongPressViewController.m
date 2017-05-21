//
//  LongPressViewController.m
//  GestureDemo
//
//  Created by 郭人豪 on 2017/5/21.
//  Copyright © 2017年 Abner_G. All rights reserved.
//

#import "LongPressViewController.h"

@interface LongPressViewController ()

@end

@implementation LongPressViewController

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
    
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressImage:)];
    longPress.minimumPressDuration = 2;
    [imageView addGestureRecognizer:longPress];
}


-(void)longPressImage:(UILongPressGestureRecognizer *)longPress{
    
    UIImageView * imageView = (UIImageView *)longPress.view;
    
    if (longPress.state == UIGestureRecognizerStateBegan) {
        
        NSLog(@"长按了这张图片");
        [UIView animateWithDuration:1.0 animations:^{
            
            imageView.frame = CGRectMake(0, 0, 300, 200);
            imageView.center = self.view.center;
        }];
    }
    
    if (longPress.state == UIGestureRecognizerStateEnded) {
        
        NSLog(@"长按结束");
        [UIView animateWithDuration:1.0 animations:^{
            
            imageView.frame = CGRectMake(0, 0, 150, 100);
            imageView.center = self.view.center;
        }];
    }
}

@end
