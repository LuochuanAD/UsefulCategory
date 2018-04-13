//
//  NSObject+ModelWithDictionary.m
//  UsefulCategory
//  GitHub地址: https://github.com/LuochuanAD/UsefulCategory
//  Created by care on 2018/4/13.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import "NSObject+ModelWithDictionary.h"
#import <objc/runtime.h>
@implementation NSObject (ModelWithDictionary)

-(NSDictionary*)toDictionary{
    unsigned int propertyListCount;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyListCount);
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    for (NSUInteger i = 0; i < propertyListCount; i++) {
        objc_property_t property = properties[i];
        const char *propertyName = property_getName(property);
        const char *propertyAttributes= property_getAttributes(property);
        
        if (propertyAttributes) {
            NSString *attributes = [NSString stringWithCString:propertyAttributes encoding:NSUTF8StringEncoding];
            if ([attributes rangeOfString:@"NSArray"].location==NSNotFound && [attributes rangeOfString:@"NSMutableArray"].location==NSNotFound) {
                if(propertyName) {
                    NSString *key = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
                    [dictionary setValue:[self valueForKey:key] forKey:key];
                }
            }else{
                if(propertyName) {
                    NSString *key = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
                    [dictionary setValue:[self valueForKey:key] forKey:key];
                }
            }
        }
        
        
    }
    return dictionary;
}

-(id) initWithDictionary:(NSDictionary*)dictionary{
    self=[self init];
    if(self){
        NSArray *propertyNames= [[self class] propertyNamesWithClass:[self class]];
        [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop){
            if ([propertyNames containsObject:key]) {
                if(obj && ![obj isKindOfClass:[NSNull class]]){
                    [self setValue:obj forKey:key];
                }
            }
        }];
    }
    return self;
    
}

+ (NSArray *)propertyNamesWithClass:(Class)cls{
    unsigned int propertyListCount;
    objc_property_t *properties = class_copyPropertyList(cls, &propertyListCount);
    NSMutableArray *propertyNameStrings = [NSMutableArray array];
    for(NSUInteger i = 0; i < propertyListCount; i++) {
        objc_property_t property = properties[i];
        const char *propertyName = property_getName(property);
        if(propertyName) {
            NSString *propertyNameString = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
            [propertyNameStrings addObject:propertyNameString];
        }
    }
    free(properties);
    return propertyNameStrings;
}

@end
