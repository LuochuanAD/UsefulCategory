//
//  NSString+Category.h
//  UsefulCategory
//  GitHub地址: https://github.com/LuochuanAD/UsefulCategory
//  Created by care on 2018/4/3.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Category)

/**
 *  计算文字高度
 *
 *  @param fontSize 字号
 *
 *  @param fixedWidth 控件宽度
 */
- (CGFloat)countHeightOfTextWithFontSize:(CGFloat)fontSize fixedWidth:(CGFloat)fixedWidth;

/**
 *  计算文字宽度
 *
 *  @param fontSize 字号
 *
 *  @param fixedHeight 控件高度
 */
- (CGFloat)countWidthOfTextWithFontSize:(CGFloat)fontSize fixedHeight:(CGFloat)fixedHeight;

@end
