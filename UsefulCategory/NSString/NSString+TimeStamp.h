//
//  NSString+TimeStamp.h
//  UsefulCategory
//  GitHub地址: https://github.com/LuochuanAD/UsefulCategory
//  Created by care on 2018/4/3.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TimeStamp)

/**
 *  通过时间戳计算时间差（几小时前、几天前
 *
 *  @param compareDate 需要对比的时间戳
 */
+ (NSString *) compareCurrentTime:(NSTimeInterval) compareDate;

/**
 *  通过时间戳得出对应的时间
 *
 *  @param timestamp 时间戳
 */
+ (NSString *) getDateStringWithTimestamp:(NSTimeInterval)timestamp;

/**
 *  通过时间戳和时间格式 显示时间
 *
 *  @param timestamp 时间戳
 *
 *  @param formatter 格式
 */
+ (NSString *) getStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter;


@end
