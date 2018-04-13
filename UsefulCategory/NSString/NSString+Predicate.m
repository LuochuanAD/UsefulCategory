//
//  NSString+Predicate.m
//  UsefulCategory
//  GitHub地址: https://github.com/LuochuanAD/UsefulCategory
//  Created by care on 2018/4/3.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import "NSString+Predicate.h"

NSString * const MobileNo          = @"^1(3|4|5|7|8)\\d{9}$";
NSString * const VerificationCode  = @"^[0-9]{6}";
NSString * const RealName          = @"^[\u4e00-\u9fa5]{2,8}$";
NSString * const Chinese           = @"^[\u4e00-\u9fa5]{0,}$";
NSString * const BankCardNumber    = @"^(\\d{16}|\\d{19})$";
NSString * const Email             = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
NSString * const LettersAndNumbers = @"^(?!\\d+$|[a-zA-Z]+$)\\w{6,12}$";
NSString * const IDnumberFor15     = @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
NSString * const IDnumberFor18     = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";

@implementation NSString (Predicate)

- (BOOL)isValidStringWithPredicateType:(PredicateType)type{
    NSString *regExp;
    switch (type) {
        case PredicateType_MobileNo:
            regExp=MobileNo;
            break;
        case PredicateType_RealName:
            regExp=RealName;
            break;
        case PredicateType_Chinese:
            regExp=Chinese;
            break;
        case PredicateType_VerificationCode:
            regExp=VerificationCode;
            break;
        case PredicateType_BankCardNumber:
            regExp=BankCardNumber;
            break;
        case PredicateType_Email:
            regExp=Email;
            break;
        case PredicateType_LettersAndNumbers:
            regExp=LettersAndNumbers;
            break;
        case PredicateType_IDnumberFor15:
            regExp=IDnumberFor15;
            break;
        case PredicateType_IDnumberFor18:
            regExp=IDnumberFor18;
            break;
        default:
            return 0;
            break;
    }
    NSPredicate*predicate=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",regExp];
    return [predicate evaluateWithObject:self];
}

@end
