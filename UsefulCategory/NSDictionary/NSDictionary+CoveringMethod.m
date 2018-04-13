//
//  NSDictionary+CoveringMethod.m
//  UsefulClass
//
//  Created by care on 2018/4/8.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import "NSDictionary+CoveringMethod.h"
#import <objc/message.h>
@implementation NSDictionary (CoveringMethod)
/*
 *  对dictionary操作时交换以下safe开头方法，提高健壮性
 *  自动使用自定义的方法覆盖系统方法,防止崩溃,推荐.
 */
+ (void)load{
    Method setValueForKey=class_getInstanceMethod(self, @selector(setValue:forKey:));
    Method safeSetValueForKey=class_getInstanceMethod(self, @selector(safeSetValue:forKey:));
    
    Method objectForKey=class_getInstanceMethod(self, @selector(objectForKey:));
    Method safeObjectForKey=class_getInstanceMethod(self, @selector(safeObjectForKeyCustom:));
    
    method_exchangeImplementations(setValueForKey, safeSetValueForKey);
    method_exchangeImplementations(objectForKey, safeObjectForKey);
    
    
}


- (void)safeSetValue:(id)object forKey:(id)key {
    if ([key isKindOfClass:[NSNull class]]) {
        return;
    }
    if ([object isKindOfClass:[NSNull class]]) {
        [self safeSetValue:@"" forKey:key];
    }else{
        [self safeSetValue:object forKey:key];
    }
}

- (id)safeObjectForKeyCustom:(id)aKey {
    id object   = nil;
    
    // 检查是否字典对象
    if (![self isKindOfClass:[NSDictionary class]]) {
        return object;
    }
    
    // 保证key必须为字符串
    if (aKey && [aKey isKindOfClass:[NSString class]]) {
        object  = [self safeObjectForKeyCustom:aKey];
    }
    
    return object;
}
//allKeysForObject:  通过值找键
- (id)safeKeyForValue:(id)value {
    for (id key in self.allKeys) {
        if ([value isEqual:[self objectForKey:key]]) {
            return key;
        }
    }
    return nil;
}



@end
