//
//  NSObject+helper.h
//  UsefulCategory
//  GitHub地址: https://github.com/LuochuanAD/UsefulCategory
//  Created by care on 2018/4/13.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (helper)

//交换类方法
+ (void)swizzleClassMethod:(SEL)origSelector withMethod:(SEL)newSelector;

//交换实例方法
- (void)swizzleInstanceMethod:(SEL)origSelector withMethod:(SEL)newSelector;

@end
