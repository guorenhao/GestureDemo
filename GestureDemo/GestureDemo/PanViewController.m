//
//  PanViewController.m
//  GestureDemo
//
//  Created by 郭人豪 on 2017/5/21.
//  Copyright © 2017年 Abner_G. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

// 图片初始中心点
@property (nonatomic) CGPoint startImageCenter;
// 手势初始中心点
@property (nonatomic) CGPoint startGCenter;

@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test];
}

- (void)test {
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 80, 200, 150)];
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:@"c001"];
    [self.view addSubview:imageView];
    
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panImage:)];
    [imageView addGestureRecognizer:pan];
}

- (void)panImage:(UIPanGestureRecognizer *)pan {
    
    UIImageView * imageView = (UIImageView *)pan.view;
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        
        //记录中心位置
        self.startImageCenter = imageView.center;
        self.startGCenter = [pan locationInView:self.view];
        return;
    }
    
    //非开始阶段
    //获得手势移动的距离 现在的位置
    CGPoint nowGCenter = [pan locationInView:self.view];
    float x = nowGCenter.x - self.startGCenter.x;
    float y = nowGCenter.y - self.startGCenter.y;
    //计算imageview的相对位移
    imageView.center = CGPointMake(self.startImageCenter.x+x, self.startImageCenter.y+y);
    
//    if (pan.state == UIGestureRecognizerStateEnded) {
//        
//        imageView.center = self.startImageCenter;
//    }
    
}


@end
