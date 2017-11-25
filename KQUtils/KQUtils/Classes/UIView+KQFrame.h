//
//  UIView+KQFrame.h
//  KQUtils
//
//  Created by keqing on 2017/11/21.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIView (KQFrame)

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;


- (void)setCorner:(CGFloat)radius;
- (void)setBorderWithWidth:(CGFloat)width color:(UIColor *)color;

@end
