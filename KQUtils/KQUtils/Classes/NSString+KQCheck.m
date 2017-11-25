//
//  NSString+KQCheck.m
//  KQUtils
//
//  Created by 柯青 on 2017/11/24.
//  Copyright © 2017年 keqing. All rights reserved.
//

#import "NSString+KQCheck.h"

@implementation NSString (KQCheck)


- (BOOL)kq_checkPhone:(NSString *)phone {
    if (phone.length != 11) {
        return false;
    }
    
    NSString *mobile = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    NSPredicate *regextes = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",mobile];
    
    return [regextes evaluateWithObject:phone];
}

- (BOOL)kq_checkBankNumber:(NSString *)number {
    // 银行卡严整个人理解规则：末位为验证码，除去验证码以外的数字串，从末位开始每隔一位乘以2，乘得的结果小于10的直接相加，大于10的分别加个位和十位数字，再加上数字串里面没有乘2的数字，最后加上校验码，结果为10的倍数，是为正确的银行卡号
    // 验证是否纯数字
    NSString *cardNumRegex = @"^\\d{6,}$";
    NSPredicate * cardNumPredicate =[NSPredicate predicateWithFormat:@"SELF MATCHES%@", cardNumRegex];
    if (![cardNumPredicate evaluateWithObject:number]){
        return false;
    }
    
    NSString *lastNum = [number substringFromIndex:number.length - 1];// 末位校验码
    NSString *forwardNum = [number substringToIndex:number.length - 1];// 除校验码外的数字
    
    NSMutableArray *forwardArr = [NSMutableArray array];// 将数字按顺序拆成单个
    for (int i = 0;i < forwardNum.length;i++) {
        [forwardArr addObject:[number substringWithRange:NSMakeRange(i, 1)]];
    }
    NSArray *forwardDescArr = [[forwardArr reverseObjectEnumerator] allObjects];// 倒序
 
    NSMutableArray *arrOddNum = [NSMutableArray array];
    NSMutableArray *arrOddNum2 = [NSMutableArray array];
    NSMutableArray *arrEvenNum = [NSMutableArray array];
    for (int i = 0; i < forwardDescArr.count; i++) {
        int num = ((NSString *)forwardDescArr[i]).intValue;
        if (i%2 != 0) {
            [arrEvenNum addObject:[NSNumber numberWithInt:num]];
        }else{
            if (num*2<9) {
                [arrOddNum addObject:[NSNumber numberWithInt:num * 2]];
            }else {// 大于等于10的将十位和个位拆开
                int decadeNum = (num * 2)/10;
                int unitNum = (num * 2)%10;
                [arrOddNum2 addObject:[NSNumber numberWithInt:unitNum]];
                [arrOddNum2 addObject:[NSNumber numberWithInt:decadeNum]];
            }
        }
    }
    
    __block int sumOddNumTotal = 0;
    [arrOddNum enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        sumOddNumTotal = sumOddNumTotal + [obj intValue];
    }];
    
    
    
    __block int sumOddNum2Total = 0;
    [arrOddNum2 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        sumOddNum2Total += [obj intValue];
    }];
    
    
    __block int sumEvenNumTotal = 0;
    [arrEvenNum enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        sumEvenNumTotal += [obj integerValue];
    }];

    
    int lastNumber = lastNum.intValue;
    
    int luhmTotal = lastNumber + sumEvenNumTotal + sumOddNum2Total + sumOddNumTotal;
    
    return luhmTotal%10 == 0 ? true : false;
}

- (BOOL)kq_checkCardID:(NSString *)cardID {
    if (cardID.length == 15) {
        //粗糙判断一下出生日期
        NSString *regex = @"^(\\d{6})([3-9][0-9][01][0-9][0-3])(\\d{4})$";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
        return [predicate evaluateWithObject:cardID];
    }else if (cardID.length == 18){
        //然后再判断最后一位的校验码,这第二步只适用于18位的身份证号码,因为15位的没有校验码(15位的比18位的少年份的前两个数和最后一位校验码,因此如果用户填写了15位的身份证号码,其实我们也可以直接帮他转成18位的)
        NSMutableArray *IDArray = [NSMutableArray array];
        for (int i = 0; i < 18; i++) {
            NSRange range = NSMakeRange(i, 1);
            NSString *subString = [cardID substringWithRange:range];
            [IDArray addObject:subString];
        }
        NSArray *coefficientArray = [NSArray arrayWithObjects:@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2", nil];
        NSArray *remainderArray = [NSArray arrayWithObjects:@"1", @"0", @"X", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2", nil];
        int sum = 0;
        for (int i = 0; i < 17; i++) {
            int coefficient = [coefficientArray[i] intValue];
            int ID = [IDArray[i] intValue];
            sum += coefficient * ID;
        }
        NSString *str = remainderArray[(sum % 11)];
        NSString *string = [cardID substringFromIndex:17];
        if ([str isEqualToString:string]) {
            return YES;
        } else {
            return NO;
        }
    }
    return false;
}

@end
