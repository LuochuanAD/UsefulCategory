//
//  NSObject+Swizzle.h
//  UsefulClass
//
//  Created by care on 2018/4/13.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

+ (BOOL)overrideMethod:(SEL)origSel withMethod:(SEL)altSel;

+ (BOOL)overrideClassMethod:(SEL)origSel withClassMethod:(SEL)altSel;

+ (BOOL)exchangeMethod:(SEL)origSel withMethod:(SEL)altSel;

+ (BOOL)exchangeClassMethod:(SEL)origSel withClassMethod:(SEL)altSel;

@end
