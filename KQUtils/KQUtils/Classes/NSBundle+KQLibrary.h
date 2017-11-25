//
//  NSBundle+KQLibrary.h
//  KQUtils
//
//  Created by 柯青 on 2017/11/25.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (KQLibrary)
+ (NSBundle *)currentLibraryBundle;
+ (NSURL *)resouceBundleURL:(NSString *)name extension:(NSString *)ext;
@end
