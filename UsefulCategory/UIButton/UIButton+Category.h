//
//  UIButton+Category.h
//  UsefulCategory
//  GitHub地址: https://github.com/LuochuanAD/UsefulCategory
//  Created by care on 2018/4/3.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIButton (EnlargeTouchArea)

/**
 *  扩大或缩小 UIButton 的点击范围
 *
 *  @param top    向上增加的点击范围(注:top参数值为负数,则反方向减小点击范围)
 *
 *  @param right  向右增加的点击范围(注:right参数值为负数,则反方向减小点击范围)
 *
 *  @param bottom 向下增加的点击范围(注:bottom参数值为负数,则反方向减小点击范围)
 *
 *  @param left   向左增加的点击范围(注:left参数值为负数,则反方向减小点击范围)
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end
