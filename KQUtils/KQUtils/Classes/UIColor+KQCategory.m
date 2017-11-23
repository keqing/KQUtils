//
//  UIColor+KQCategory.m
//  KQUtils
//
//  Created by keqing on 2017/11/23.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import "UIColor+KQCategory.h"

@implementation UIColor (KQCategory)

+ (UIColor *)kq_colorWithRed:(float)red green:(float)green blue:(float)blue alpha:(float)alpha {
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

+ (UIColor *)kq_colorWithRed:(float)red green:(float)green blue:(float)blue {
    return [UIColor kq_colorWithRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)kq_colorWithHexRGB:(NSUInteger)rgbValue alpha:(float)alpha{
    float red = ((rgbValue & 0xff0000) >> 16);
    float green = ((rgbValue & 0xff00) >> 8);
    float blue = (rgbValue & 0xff);
    return [UIColor kq_colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)kq_colorWithHexRGB:(NSUInteger)rgbValue{
    return [UIColor kq_colorWithHexRGB:rgbValue alpha:1.0];
}

+ (UIColor *)kq_colorWithHexString:(NSString *)colorStr {
    
    return [UIColor kq_colorWithHexString:colorStr alpha:1.0];
}

+ (UIColor *)kq_colorWithHexString:(NSString *)colorStr alpha:(float)alpha {
    NSString *cStr = [[colorStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    //字符串长度必须是6到8位
    
    if ([cStr length] < 6) {
        return [UIColor clearColor];
    }
    
    //判断前缀
    if ([cStr hasPrefix:@"0X"]) {
        cStr = [cStr substringFromIndex:2];
    }else if([cStr hasPrefix:@"#"]){
        cStr = [cStr substringFromIndex:1];
    }
    //提取之后 长度必须为6
    if (cStr.length != 6) {
        return [UIColor clearColor];
    }
    
    //从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.length = 2;
    range.location = 0;
    
    //R、G、B值
    NSString *redStr = [cStr substringWithRange:range];
    
    range.location = 2;
    NSString *greenStr = [cStr substringWithRange:range];
    
    range.location = 4;
    NSString *blueStr = [cStr substringWithRange:range];
    
    //数值转换
    unsigned int r,g,b;
    [[NSScanner scannerWithString:redStr] scanHexInt:&r];
    [[NSScanner scannerWithString:greenStr] scanHexInt:&g];
    [[NSScanner scannerWithString:blueStr] scanHexInt:&b];
    
    return [UIColor kq_colorWithRed:r green:g blue:b alpha:alpha];
}


@end
