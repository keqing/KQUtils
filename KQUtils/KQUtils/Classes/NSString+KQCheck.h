//
//  NSString+KQCheck.h
//  KQUtils
//
//  Created by 柯青 on 2017/11/24.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 一些特定字符串的验证
 */
@interface NSString (KQCheck)

/**
 检验手机号码是否有效

 @return true为有效，false为无效
 */
- (BOOL)kq_checkPhone:(NSString *)phone;
/**
 检验银行卡号是否有效

 @return true有效，false无效
 */
- (BOOL)kq_checkBankNumber:(NSString *)number;
/**
 检验身份证号码是否有效

 @return true为有效，false为无效
 */
- (BOOL)kq_checkCardID:(NSString *)cardID;
@end
