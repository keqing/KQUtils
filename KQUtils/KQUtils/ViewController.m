//
//  ViewController.m
//  KQUtils
//
//  Created by 仁和Mac on 2017/11/21.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import "ViewController.h"
#import "UIView+KQFrame.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc] init];
    [label setOrigin:CGPointMake(100, 100)];
    [label setSize:CGSizeMake(100, 100)];
    [label setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:label ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
