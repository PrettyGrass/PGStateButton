//
//  ViewController.m
//  PGStateButtonExample
//
//  Created by renxun on 2018/8/8.
//  Copyright © 2018年 renxun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PGStateButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PGStateButton *bu = [[PGStateButton alloc] initWithFrame:(CGRectMake(100, 100, 100, 100))];
    [self.view addSubview:bu];
    [bu addTarget:self action:@selector(_action:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [bu setLayerBorderWidth:20 forState:(UIControlStateNormal)];
    [bu setLayerBorderWidth:10 forState:(UIControlStateSelected)];
    [bu setLayerBorderColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [bu setLayerBorderColor:[UIColor blueColor] forState:(UIControlStateSelected)];
    
    [bu setLayerCornerRadius:12 forState:(UIControlStateSelected)];
    [bu setLayerCornerRadius:0 forState:(UIControlStateNormal)];
    {
        [self.btn setLayerBorderWidth:1 forState:(UIControlStateNormal)];
        [self.btn setLayerBorderWidth:13 forState:(UIControlStateSelected)];
        [self.btn setLayerBorderColor:[UIColor redColor] forState:(UIControlStateNormal)];
        [self.btn setLayerBorderColor:[UIColor blueColor] forState:(UIControlStateSelected)];
        
        [self.btn setLayerCornerRadius:2 forState:(UIControlStateSelected)];
        [self.btn setLayerCornerRadius:0 forState:(UIControlStateNormal)];
    }
    
}

- (void)_action:(UIButton *)sender {
    sender.selected = !sender.selected;
}

@end
