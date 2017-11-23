//
//  UIColor+KQCategory.h
//  KQUtils
//
//  Created by keqing on 2017/11/23.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (KQCategory)

/**
 颜色的类方法
 
 @param red 红色值（最大255)
 @param green 绿色值（最大255）
 @param blue 蓝色值 （最大255）
 @return 颜色
 */
+ (UIColor *)kq_colorWithRed:(float)red green:(float)green blue:(float)blue;

/**
 颜色的类方法
 
 @param red 红色值（最大255)
 @param green 绿色值（最大255）
 @param blue 蓝色值 （最大255）
 @param alpha 透明度
 @return 颜色
 */
+ (UIColor *)kq_colorWithRed:(float)red green:(float)green blue:(float)blue alpha:(float)alpha;

/**
 颜色的类方法

 @param rgbValue 16进制的值
 @return 颜色
 */
+ (UIColor *)kq_colorWithHexRGB:(NSUInteger)rgbValue;

/**
 颜色的类方法

 @param rgbValue 16进制的值
 @param alpha 透明度
 @return 颜色
 */
+ (UIColor *)kq_colorWithHexRGB:(NSUInteger)rgbValue alpha:(float)alpha;

/**
 颜色的类方法

 @param colorStr 16进制RGB字符串
 @return 颜色
 */
+ (UIColor *)kq_colorWithHexString:(NSString *)colorStr;

/**
 颜色的类方法

 @param colorStr 16进制RGB字符串
 @param alpha 透明度
 @return 颜色
 */
+ (UIColor *)kq_colorWithHexString:(NSString *)colorStr alpha:(float)alpha;
@end
