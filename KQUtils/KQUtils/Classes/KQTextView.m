//
//  KQTextView.m
//  KQUtils
//
//  Created by keqing on 2017/11/23.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import "KQTextView.h"

@interface KQTextView()<UITextViewDelegate>

@property (nonatomic, weak) UILabel *placeholderLabel;

@end


@implementation KQTextView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupView];
    }
    return self;
}


- (void)setupView {
    self.backgroundColor = [UIColor whiteColor];
    
    // 添加一个显示提醒文字的label （显示占位文本label）
    UILabel *label = [[UILabel alloc] init];
    [label setNumberOfLines:0];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont systemFontOfSize:14]];
    [label setTextColor:[UIColor lightGrayColor]];
    [self addSubview:label];
    
    self.placeholderLabel = label;
    
    
    
    
    // 添加监听事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextDidChange) name:UITextViewTextDidChangeNotification object:self];
}



- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


/**
 监听用户输入的内容的改变

 */
- (void) textViewTextDidChange{
    [self.placeholderLabel setHidden:self.text.length ? true : false];
}


#pragma mark - 公共方法

- (void)setText:(NSString *)text {
    [super setText:text];
    
    //通知监听方法  改变
    [self textViewTextDidChange];
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = [placeholder copy];
    
    //设置文本
    self.placeholderLabel.text = placeholder;
    
    //重新计算控件的frame
    [self setNeedsLayout];
}


- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    _placeholderColor = placeholderColor;
    //设置颜色
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    
    //重新计算控件的frame
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 根据文字计算label的高度
    CGSize size = [self.placeholderLabel sizeThatFits:CGSizeMake(self.frame.size.width - 2 * 5, CGFLOAT_MAX)];
    self.placeholderLabel.frame = CGRectMake(5, 8, self.frame.size.width - 10, size.height);
}

@end
