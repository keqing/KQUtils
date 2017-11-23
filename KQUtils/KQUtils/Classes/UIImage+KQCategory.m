//
//  UIImage+KQCategory.m
//  KQUtils
//
//  Created by keqing on 2017/11/23.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import "UIImage+KQCategory.h"
#import "UIColor+KQCategory.h"

@implementation UIImage (KQCategory)


+ (UIImage *)kq_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    
    //绘制一个像素的 context
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *)kq_imageWithColorRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue {
    return [UIImage kq_imageWithColor:[UIColor kq_colorWithRed:red green:green blue:blue]];
}


+ (instancetype)kq_imageWithContent:(NSString *)text contentColor:(UIColor *)color bgColor:(UIColor *)bgColor andFrame:(CGRect)rect {
    CGRect frame = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width*2, rect.size.height*2);
    UIGraphicsBeginImageContext(frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, bgColor.CGColor);
    CGContextFillRect(context, CGRectMake(-frame.size.width/2, -frame.size.height/2, frame.size.width*2, frame.size.height*2));
    
    NSDictionary *dict = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:30],NSForegroundColorAttributeName:color};
    //计算文本内容的宽度
    CGSize size;
    if (text.length > 2) {
        size = CGSizeMake(30, 39);//[text boundingRectWithSize:CGSizeMake(32, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
        [text drawInRect:CGRectMake(floor(frame.size.width/2 - size.width), floor(frame.size.height/2 - size.height), (floor(size.width)*2+ 1), (floor(size.height)*2 + 1)) withAttributes:dict];
    }else{
        
        size = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
        [text drawInRect:CGRectMake(floor(frame.size.width/2 - size.width/2), floor(frame.size.height/2 - size.height/2), (floor(size.width)*2+ 1), (floor(size.height)*2 + 1)) withAttributes:dict];
    }
    
    
    CGImageRef imgRef = CGBitmapContextCreateImage(context);
    UIImage *image = [UIImage imageWithCGImage:imgRef scale:2.0 orientation:UIImageOrientationUp];
    UIGraphicsEndImageContext();
    return image;
}

@end
