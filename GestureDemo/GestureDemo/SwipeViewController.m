//
//  SwipeViewController.m
//  GestureDemo
//
//  Created by 郭人豪 on 2017/5/21.
//  Copyright © 2017年 Abner_G. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test];
}

- (void)test {
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 80, 200, 150)];
    imageView.center = self.view.center;
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:@"c001"];
    [self.view addSubview:imageView];
    
    UISwipeGestureRecognizer * swipe1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeImage:)];
    //设置扫的方向
    swipe1.direction = UISwipeGestureRecognizerDirectionUp;
    [imageView addGestureRecognizer:swipe1];
    
    UISwipeGestureRecognizer * swipe2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeImage:)];
    //设置扫的方向
    swipe2.direction = UISwipeGestureRecognizerDirectionLeft;
    [imageView addGestureRecognizer:swipe2];
    
    UISwipeGestureRecognizer * swipe3 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeImage:)];
    //设置扫的方向
    swipe3.direction = UISwipeGestureRecognizerDirectionDown;
    [imageView addGestureRecognizer:swipe3];
    
    UISwipeGestureRecognizer * swipe4 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeImage:)];
    //设置扫的方向
    swipe4.direction = UISwipeGestureRecognizerDirectionRight;
    [imageView addGestureRecognizer:swipe4];
}

-(void)swipeImage:(UISwipeGestureRecognizer *)swipe{
    //实现要添加的功能
    NSLog(@"扫到了图片");
    UIImageView * imageView = (UIImageView *)swipe.view;
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        
        imageView.center = CGPointMake(imageView.center.x - 40, imageView.center.y);
        NSLog(@"图片向左移动了");
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        
        imageView.center = CGPointMake(imageView.center.x + 40, imageView.center.y);
        NSLog(@"图片向右移动了");
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionDown) {
        
        imageView.center = CGPointMake(imageView.center.x, imageView.center.y + 40);
        NSLog(@"图片向下移动了");
    }else if (swipe.direction == UISwipeGestureRecognizerDirectionUp) {
        
        imageView.center = CGPointMake(imageView.center.x, imageView.center.y - 40);
        NSLog(@"图片向上移动了");
    }
    
    
}

@end
