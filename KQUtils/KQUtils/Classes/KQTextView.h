//
//  KQTextView.h
//  KQUtils
//
//  Created by keqing on 2017/11/23.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 带placeholder的TextView
 */
@interface KQTextView : UITextView

/*
 提示文本
 */
@property (nonatomic, copy) NSString * placeholder;
/*
 提示文本颜色
 */
@property (nonatomic, strong) UIColor * placeholderColor;

@end

NS_ASSUME_NONNULL_END
