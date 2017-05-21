//
//  RotationViewController.m
//  GestureDemo
//
//  Created by 郭人豪 on 2017/5/21.
//  Copyright © 2017年 Abner_G. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

// 图片初始角度
@property (nonatomic, assign) float startRotation;
@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test];
}

- (void)test {
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    imageView.center = self.view.center;
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:@"c001"];
    [self.view addSubview:imageView];
    
    UIRotationGestureRecognizer * rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationImage:)];
    [imageView addGestureRecognizer:rotation];
}


-(void)rotationImage:(UIRotationGestureRecognizer *)rotation{
    
    UIImageView * imageView = (UIImageView *)rotation.view;
    
    // 旋转图片
    imageView.transform = CGAffineTransformMakeRotation(rotation.rotation + self.startRotation);
    
    if (rotation.state == UIGestureRecognizerStateEnded) {
        
        self.startRotation += rotation.rotation;
    }
}


@end
