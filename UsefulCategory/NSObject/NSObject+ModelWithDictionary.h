//
//  NSObject+ModelWithDictionary.h
//  UsefulCategory
//  GitHub地址: https://github.com/LuochuanAD/UsefulCategory
//  Created by care on 2018/4/13.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ModelWithDictionary)

/**
 *  Model转字典
 */
- (NSDictionary*)toDictionary;
/**
 *  字典转Model (警告:字典只能为一层结构)
 */
-(id) initWithDictionary:(NSDictionary*)dictionary;

@end
