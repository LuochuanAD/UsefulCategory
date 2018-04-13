//
//  UILabel+AutoResize.h
//  UsefulCategory
//  GitHub地址: https://github.com/LuochuanAD/UsefulCategory
//  Created by care on 2018/4/3.
//  Copyright © 2018年 luochuan. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UILabel (AutoResize)
/**
 *  UIlable控件高度自适应文字实际计算的高度 (注:lable.numberOfLines=0)
 *
 *  @param text lable.text
 */
- (void)setAutoResizeWithText:(NSString*)text;

@end
