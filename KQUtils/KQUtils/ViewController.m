//
//  ViewController.m
//  KQUtils
//
//  Created by 仁和Mac on 2017/11/21.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import "ViewController.h"
#import "UIView+KQFrame.h"
#import "NSString+KQCategory.h"
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
    
    
    UIButton *btn = [self.view viewWithTag:10];
    [btn setCorner:4];
    [btn setBorderWithWidth:1 color:[UIColor redColor]];
    
    UIWebView *web = [self.view viewWithTag:11];
    [web loadHTMLString:[NSString kq_formatHtmlWithContent:@"呵呵"] baseURL:nil
     ];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
