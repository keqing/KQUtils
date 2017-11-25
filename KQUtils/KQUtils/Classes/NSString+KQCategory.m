//
//  NSString+KQCategory.m
//  KQUtils
//
//  Created by 柯青 on 2017/11/24.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import "NSString+KQCategory.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSBundle+KQLibrary.h"

@implementation NSString (KQCategory)

- (NSString *)kq_MD5 {
    const char *str = [self UTF8String];//[self cStringUsingEncoding:NSUTF8StringEncoding];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x",result[i]];
    }
    return digest;
}

- (NSString *)kq_encodingURLQuery {
    NSCharacterSet *charSet = [NSCharacterSet URLQueryAllowedCharacterSet];
    return [self stringByAddingPercentEncodingWithAllowedCharacters:charSet];
}

+ (NSString *)kq_formatHtmlWithImageURLStr:(NSString *)urlStr {
    NSURL *bundlePath = [NSBundle resouceBundleURL:@"Resource" extension:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithURL:bundlePath];
    NSString *filePath = [resourceBundle pathForResource:@"ImageFormatter" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSString *formatStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    formatStr = [formatStr stringByReplacingOccurrencesOfString:@"xxxxxxxxxxxxxxxxxx" withString:urlStr];
    return formatStr;
}

+ (NSString *)kq_formatHtmlWithContent:(NSString *)content {
    NSURL *bundlePath = [NSBundle resouceBundleURL:@"Resource" extension:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithURL:bundlePath];
    NSString *filePath = [resourceBundle pathForResource:@"htmlFormatter" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSString *formatStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    formatStr = [formatStr stringByReplacingOccurrencesOfString:@"xxxxxxxxxxxxxxxxxx" withString:content];
    return formatStr;
}

@end
