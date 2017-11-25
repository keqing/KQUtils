//
//  NSString+KQCategory.h
//  KQUtils
//
//  Created by 柯青 on 2017/11/24.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KQCategory)
/**
 对字符串进行MD5加密

 @return 加密后的32位字符串
 */
- (NSString *)kq_MD5;
/**
 对网络请求参数进行编码

 @return 编码后的字符串
 */
- (NSString *)kq_encodingURLQuery;
/**
 用于网络图片适配屏幕尺寸显示，将图片的URL插入到一个定义好HTML格式文本中，置于UIWebView中显示

 @param urlStr 图片url地址
 @return 处理好的HTML格式字符串
 */
+ (NSString *)kq_formatHtmlWithImageURLStr:(NSString *)urlStr;
/**
 用于web格式的文本适配设备屏幕尺寸显示，将需要展示的内容插入到一个定义好HTML格式文本中，加载到UIWebView上显示

 @param content 需要显示的内容
 @return 处理好的HTML格式字符串
 */
+ (NSString *)kq_formatHtmlWithContent:(NSString *)content;

@end
