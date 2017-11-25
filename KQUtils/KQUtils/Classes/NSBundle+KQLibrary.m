//
//  NSBundle+KQLibrary.m
//  KQUtils
//
//  Created by 柯青 on 2017/11/25.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import "NSBundle+KQLibrary.h"
#import "KQTextView.h"
//加入 framework 特性所带来的变化。一个显著区别就是当你的 pod 库以 framework 形式被使用时，你的资源不是被拷贝到 mainBundle 下，而是被放到 pod 的最终产物—— framework 里。此时，你必须保证自己在访问这个 framework 的 bundle，而不是 client target 的。
@implementation NSBundle (KQLibrary)

+ (NSBundle *)currentLibraryBundle {
    return [NSBundle bundleForClass:[KQTextView class]];
}

+ (NSURL *)resouceBundleURL:(NSString *)name extension:(NSString *)ext {
    return [[self currentLibraryBundle] URLForResource:name withExtension:ext];
}

@end
