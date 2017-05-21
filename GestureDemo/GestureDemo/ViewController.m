//
//  ViewController.m
//  GestureDemo
//
//  Created by 郭人豪 on 2017/5/21.
//  Copyright © 2017年 Abner_G. All rights reserved.
//

#import "ViewController.h"
#import "TapViewController.h"
#import "PanViewController.h"
#import "SwipeViewController.h"
#import "LongPressViewController.h"
#import "RotationViewController.h"
#import "PinchViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"iOS六大手势";
    [self loadData];
    [self.view addSubview:self.tableView];
}

- (void)loadData {
    
    [self.dataArr addObjectsFromArray:@[@"轻触 tap",@"拖拽 pan",@"轻扫 swipe",@"长按 longPress",@"旋转 rotation",@"捏合 pinch"]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell_Gesture"];
    if (indexPath.row < self.dataArr.count) {
        
        cell.textLabel.text = self.dataArr[indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        TapViewController * detail = [[TapViewController alloc] init];
        detail.navTitle = self.dataArr[indexPath.row];
        [self.navigationController pushViewController:detail animated:YES];
    } else if (indexPath.row == 1) {
        
        PanViewController * detail = [[PanViewController alloc] init];
        detail.navTitle = self.dataArr[indexPath.row];
        [self.navigationController pushViewController:detail animated:YES];
    } else if (indexPath.row == 2) {
        
        SwipeViewController * detail = [[SwipeViewController alloc] init];
        detail.navTitle = self.dataArr[indexPath.row];
        [self.navigationController pushViewController:detail animated:YES];
    } else if (indexPath.row == 3) {
        
        LongPressViewController * detail = [[LongPressViewController alloc] init];
        detail.navTitle = self.dataArr[indexPath.row];
        [self.navigationController pushViewController:detail animated:YES];
    } else if (indexPath.row == 4) {
        
        RotationViewController * detail = [[RotationViewController alloc] init];
        detail.navTitle = self.dataArr[indexPath.row];
        [self.navigationController pushViewController:detail animated:YES];
    } else if (indexPath.row == 5) {
        
        PinchViewController * detail = [[PinchViewController alloc] init];
        detail.navTitle = self.dataArr[indexPath.row];
        [self.navigationController pushViewController:detail animated:YES];
    }
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell_Gesture"];
        tableView.tableFooterView = [[UIView alloc] init];
        _tableView = tableView;
    }
    return _tableView;
}

- (NSMutableArray *)dataArr {
    
    if (!_dataArr) {
        
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end
