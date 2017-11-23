//
//  UIImage+KQCategory.h
//  KQUtils
//
//  Created by keqing on 2017/11/23.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (KQCategory)
/**
 根据文本内容  绘制 UIimage

 @param text 文本
 @param color 文本颜色
 @param bgColor 背景颜色
 @param rect 尺寸
 @return UIImage
 */
+ (instancetype)kq_imageWithContent:(NSString *)text contentColor:(UIColor *)color bgColor:(UIColor *)bgColor andFrame:(CGRect)rect;

/**
 根据颜色绘制UIImage

 @param color 颜色
 @return UIImage
 */
+ (UIImage *)kq_imageWithColor:(UIColor *)color;

/**
 根据RGB值绘制UIImage

 @param red 红色值
 @param green 绿色值
 @param blue 蓝色值
 @return UIImage
 */
+ (UIImage *)kq_imageWithColorRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue;
@end
