//
//  NSMutableArray+CoveringMethod.m
//  UsefulClass
//
//  Created by care on 2018/4/8.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import "NSMutableArray+CoveringMethod.h"
#import <objc/message.h>
@implementation NSMutableArray (CoveringMethod)
/*
 *  对MutableArray操作时交换以下safe开头方法，提高健壮性
 *  自动使用自定义的方法覆盖系统方法,防止崩溃,推荐.
 */
+ (void)load{
    Method setObjectAtIndexedSubscript =class_getClassMethod(self, @selector(setObject:atIndexedSubscript:));
    Method safeSetObjectAtIndexedSubscript =class_getClassMethod(self, @selector(safeSetObject:atIndexedSubscript:));
    
    Method addObject=class_getClassMethod(self, @selector(addObject:));
    Method safeAddObject=class_getClassMethod(self, @selector(safeAddObject:));
    
    Method insertObjectAtIndex=class_getClassMethod(self, @selector(insertObject:atIndex:));
    Method safeInsertObjectAtIndex=class_getClassMethod(self, @selector(safeInsertObject:atIndex:));
    
    Method insertObjectsAtIndexs=class_getClassMethod(self, @selector(insertObjects:atIndexes:));
    Method safeInsertObjectsAtIndexs=class_getClassMethod(self, @selector(safeInsertObjects:atIndexes:));
    
    Method removeObjectAtIndex=class_getClassMethod(self, @selector(removeObjectAtIndex:));
    Method safeRemoveObjectAtIndex=class_getClassMethod(self, @selector(safeRemoveObjectAtIndex:));
    
    Method removeObjectsInRange=class_getClassMethod(self, @selector(removeObjectsInRange:));
    Method safeRemoveObjectsInRange=class_getClassMethod(self, @selector(safeRemoveObjectsInRange:));
    
    method_exchangeImplementations(setObjectAtIndexedSubscript, safeSetObjectAtIndexedSubscript);
    method_exchangeImplementations(addObject, safeAddObject);
    method_exchangeImplementations(insertObjectAtIndex, safeInsertObjectAtIndex);
    method_exchangeImplementations(insertObjectsAtIndexs, safeInsertObjectsAtIndexs);
    method_exchangeImplementations(removeObjectAtIndex, safeRemoveObjectAtIndex);
    method_exchangeImplementations(removeObjectsInRange, safeRemoveObjectsInRange);
    
}



- (void)safeSetObject:(id)obj atIndexedSubscript:(NSUInteger)idx
{
    if (obj == nil) {
        return ;
    }
    
    if (self.count < idx) {
        return ;
    }
    
    if (idx == self.count) {
        [self addObject:obj];
    } else {
        [self replaceObjectAtIndex:idx withObject:obj];
    }
}

- (void)safeAddObject:(id)object
{
    if (object == nil) {
        return;
    } else {
        [self addObject:object];
    }
}

- (void)safeInsertObject:(id)object atIndex:(NSUInteger)index
{
    if (object == nil) {
        return;
    } else if (index > self.count) {
        return;
    } else {
        [self insertObject:object atIndex:index];
    }
}

- (void)safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs
{
    NSUInteger firstIndex = indexs.firstIndex;
    if (indexs == nil) {
        return;
    } else if (indexs.count!=objects.count || firstIndex>objects.count) {
        return;
    } else {
        [self insertObjects:objects atIndexes:indexs];
    }
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return;
    } else {
        [self removeObjectAtIndex:index];
    }
}

- (void)safeRemoveObjectsInRange:(NSRange)range
{
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    if (location + length > self.count) {
        return;
    } else {
        [self removeObjectsInRange:range];
    }
}


@end
