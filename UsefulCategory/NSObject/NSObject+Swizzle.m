//
//  NSObject+Swizzle.m
//  UsefulClass
//
//  Created by care on 2018/4/13.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>
@implementation NSObject (Swizzle)
+ (BOOL)overrideMethod:(SEL)origSel withMethod:(SEL)altSel
{
    Method origMethod =class_getInstanceMethod(self, origSel);
    if (!origMethod) {
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(origSel), [self class]);
        return NO;
    }
    
    Method altMethod =class_getInstanceMethod(self, altSel);
    if (!altMethod) {
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(altSel), [self class]);
        return NO;
    }
    
    method_setImplementation(origMethod, class_getMethodImplementation(self, altSel));
    return YES;
}

+ (BOOL)overrideClassMethod:(SEL)origSel withClassMethod:(SEL)altSel
{
    Class c = object_getClass((id)self);
    return [c overrideMethod:origSel withMethod:altSel];
}

+ (BOOL)exchangeMethod:(SEL)origSel withMethod:(SEL)altSel
{
    Method origMethod =class_getInstanceMethod(self, origSel);
    if (!origMethod) {
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(origSel), [self class]);
        return NO;
    }
    
    Method altMethod =class_getInstanceMethod(self, altSel);
    if (!altMethod) {
        NSLog(@"original method %@ not found for class %@", NSStringFromSelector(altSel), [self class]);
        return NO;
    }
    
    method_exchangeImplementations(class_getInstanceMethod(self, origSel),class_getInstanceMethod(self, altSel));
    
    return YES;
}

+ (BOOL)exchangeClassMethod:(SEL)origSel withClassMethod:(SEL)altSel
{
    Class c = object_getClass((id)self);
    return [c exchangeMethod:origSel withMethod:altSel];
}

@end
