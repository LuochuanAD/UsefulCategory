//
//  NSMutableDictionary+CoveringMethod.m
//  UsefulClass
//
//  Created by care on 2018/4/8.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import "NSMutableDictionary+CoveringMethod.h"
#import <objc/message.h>
@implementation NSMutableDictionary (CoveringMethod)
/*
 *  对mutableDictionary操作时交换以下safe开头方法，提高健壮性
 *  自动使用自定义的方法覆盖系统方法,防止崩溃,推荐.
 */
+ (void)load{
    Method setObjectForKeySubscript=class_getClassMethod(self, @selector(setObject:forKeyedSubscript:));
    Method safeSetObjectForKeySubscript=class_getClassMethod(self, @selector(safeSetObject:forKeyedSubscript:));
    
    Method setObjectForKey=class_getClassMethod(self, @selector(setObject:forKey:));
    Method safeSetObjectForKey=class_getClassMethod(self, @selector(safeSetObject:forKey:));
    
    Method objectForKey=class_getClassMethod(self, @selector(objectForKey:));
    Method safeObjectForKey=class_getClassMethod(self, @selector(safeObjectForKey:));
    
    method_exchangeImplementations(setObjectForKeySubscript, safeSetObjectForKeySubscript);
    method_exchangeImplementations(setObjectForKey, safeSetObjectForKey);
    method_exchangeImplementations(objectForKey, safeObjectForKey);
}


- (void)safeSetObject:(id)obj forKeyedSubscript:(id<NSCopying>)key
{
    if (!key) {
        return ;
    }
    
    if (!obj) {
        [self removeObjectForKey:key];
    }
    else {
        [self setObject:obj forKey:key];
    }
}

- (void)safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey
{
    if (aObj && ![aObj isKindOfClass:[NSNull class]] && aKey) {
        [self setObject:aObj forKey:aKey];
    } else {
        return;
    }
}

- (id)safeObjectForKey:(id<NSCopying>)aKey
{
    if (aKey != nil) {
        return [self objectForKey:aKey];
    } else {
        return nil;
    }
}

@end
