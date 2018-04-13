//
//  NSArray+CoveringMethod.m
//  UsefulClass
//
//  Created by care on 2018/4/3.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import "NSArray+CoveringMethod.h"
#import <objc/message.h>
@implementation NSArray (CoveringMethod)
/*
 *  对Array操作时交换以下safe开头方法，提高健壮性
 *  自动使用自定义的方法覆盖系统方法,防止崩溃,推荐.
 */
+ (void)load{
    
    Method objectAtIndexMethod = class_getInstanceMethod(self, @selector(objectAtIndex:));
    Method safeobjectAtIndexMethod = class_getInstanceMethod(self, @selector(safeObjectAtIndex:));
    
    Method indexOfObjectMethod = class_getInstanceMethod(self, @selector(indexOfObject:));
    Method safeIndexOfObjectMethod = class_getInstanceMethod(self, @selector(safeIndexOfObject:));
    
    Method subarrayWithRangeMethod = class_getInstanceMethod(self, @selector(subarrayWithRange:));
    Method safeSubarrayWithRangeMethod = class_getInstanceMethod(self, @selector(safeSubarrayWithRange:));
 
    method_exchangeImplementations(objectAtIndexMethod, safeobjectAtIndexMethod);
    method_exchangeImplementations(indexOfObjectMethod, safeIndexOfObjectMethod);
    method_exchangeImplementations(subarrayWithRangeMethod, safeSubarrayWithRangeMethod);
    
    
}

- (instancetype)safeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    } else {
        return [self safeObjectAtIndex:index];
    }
}

- (NSUInteger)safeIndexOfObject:(id)anObject
{
    if (anObject == nil) {
        return NSNotFound;
    } else {
        return [self safeIndexOfObject:anObject];
    }
}

- (NSArray *)safeSubarrayWithRange:(NSRange)range
{
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    if (location + length > self.count) {
        //超过了边界,就获取从loction开始所有的item
        if ((location + length) > self.count) {
            length = (self.count - location);
            return [self safeSubarrayWithRange:NSMakeRange(location, length)];
        }
        
        return nil;
    }
    else {
        return [self safeSubarrayWithRange:range];
    }
}







@end
