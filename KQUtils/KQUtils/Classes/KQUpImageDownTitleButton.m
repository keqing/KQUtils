//
//  KQUpImageDownTitleButton.m
//  KQUtils
//
//  Created by keqing on 2017/11/23.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import "KQUpImageDownTitleButton.h"

#define SPACE 8
#define RATIO_DEFAULT 4/6.0f

@implementation KQUpImageDownTitleButton


- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGRect rect = CGRectMake(0, SPACE, contentRect.size.width, contentRect.size.height * (1- RATIO_DEFAULT));
    
    return rect;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    CGRect rect = CGRectMake(0, contentRect.size.height * RATIO_DEFAULT + SPACE , contentRect.size.width, contentRect.size.height * (1- RATIO_DEFAULT) - SPACE * 2);
    
    return rect;
}

@end
