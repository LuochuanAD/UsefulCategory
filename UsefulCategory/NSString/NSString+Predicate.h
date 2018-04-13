//
//  NSString+Predicate.h
//  UsefulCategory
//  GitHub地址: https://github.com/LuochuanAD/UsefulCategory
//  Created by care on 2018/4/3.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PredicateType){
    PredicateType_MobileNo,          //检测有效的电话号码
    PredicateType_RealName,          //检测有效的真实姓名
    PredicateType_Chinese,           //检测是否只有中文
    PredicateType_VerificationCode,  //检测有效的验证码(根据自家的验证码位数进行修改)
    PredicateType_BankCardNumber,    //检测有效的银行卡号
    PredicateType_Email,             //检测有效的邮箱
    PredicateType_LettersAndNumbers, //检测有效的字母和数字
    PredicateType_IDnumberFor15,     //检测有效身份证 15位
    PredicateType_IDnumberFor18,     //检测有效身份证 18位
};

@interface NSString (Predicate)
/**
 *  验证字符串 是否符合正则表达式
 *
 *  @param type 正则表达式类型
 */
- (BOOL)isValidStringWithPredicateType:(PredicateType)type;

@end
