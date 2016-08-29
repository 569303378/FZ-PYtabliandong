//
//  ViewController.m
//  PliandongTableView
//
//  Created by Apple on 16/7/14.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "PYleibieVC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(100, 100, 80, 60);
//    button.backgroundColor = [UIColor blueColor];
//    button.titleLabel.backgroundColor = [UIColor cyanColor];
    [button setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [button setTitle:@"点击进入" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
}

#pragma mark ======= 点击事件
- (void)buttonAction {
    PYleibieVC *leibieVC = [[PYleibieVC alloc] init];
    [self.navigationController pushViewController:leibieVC animated:YES];
//    [self presentViewController:leibieVC animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
