//
//  UIView+KQFrame.m
//  KQUtils
//
//  Created by keqing on 2017/11/21.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import "UIView+KQFrame.h"

/*
 *这里添加的属性，实现我们在外部的调用，其实在这种情况下是不会自动生成实例变量的,
 *我们只是通过重写setter和getter方法来对self.frame进行操作
 */

@implementation UIView (KQFrame)

// 因为 get 和 setter方法中  不是直接对 分类的属性操作，可以这样实现，如果是要直接对分类的属性进行赋值，要用到runtime，才能完成操作
- (CGFloat)x{
    
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x{
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin :(CGPoint)point {
    CGRect rect = self.frame;
    rect.origin = point;
    self.frame = rect;
}

- (CGSize)size{
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}


- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (CGFloat)height{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}


- (void)setCorner:(CGFloat)radius {
    [self.layer setCornerRadius:radius];
    [self.layer setMasksToBounds:true];
}

- (void)setBorderWithWidth:(CGFloat)width color:(UIColor *)color {
    [self.layer setBorderWidth:width];
    [self.layer setBorderColor:color ? color.CGColor : [UIColor clearColor].CGColor];
}


@end
