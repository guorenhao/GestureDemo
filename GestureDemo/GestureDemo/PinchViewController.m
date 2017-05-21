//
//  PinchViewController.m
//  GestureDemo
//
//  Created by 郭人豪 on 2017/5/21.
//  Copyright © 2017年 Abner_G. All rights reserved.
//

#import "PinchViewController.h"

@interface PinchViewController ()

// 图片初始缩放系数
@property (nonatomic, assign) float startScale;
@end

@implementation PinchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test];
}

- (void)test {
    
    self.startScale = 1.0;
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    imageView.center = self.view.center;
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:@"c001"];
    [self.view addSubview:imageView];
    
    UIPinchGestureRecognizer * pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchImage:)];
    [imageView addGestureRecognizer:pinch];
}


-(void)pinchImage:(UIPinchGestureRecognizer *)pinch{
    
    UIImageView * imageView = (UIImageView *)pinch.view;
    
    // 缩放图片
    imageView.transform = CGAffineTransformMakeScale(pinch.scale * self.startScale, pinch.scale * self.startScale);
    
    if (pinch.state == UIGestureRecognizerStateEnded) {
        
        self.startScale *= pinch.scale;
        if (self.startScale >= 2.0) {
            
            self.startScale = 2.0;
            [UIView animateWithDuration:0.3 animations:^{
                
                imageView.transform = CGAffineTransformMakeScale(self.startScale, self.startScale);
            }];
        } else if (self.startScale <= 0.5) {
            
            self.startScale = 0.5;
            [UIView animateWithDuration:0.3 animations:^{
                
                imageView.transform = CGAffineTransformMakeScale(self.startScale, self.startScale);
            }];
        }
    }
    
}


@end
