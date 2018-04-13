//
//  UIImage+Category.h
//  UsefulCategory
//  GitHub地址: https://github.com/LuochuanAD/UsefulCategory
//  Created by care on 2018/4/12.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,ImageBlurType) {
    ImageBlurSoft,
    ImageBlurLight,
    ImageBlurExtraLight,
    ImageBlurDark,
};
@interface UIImage (Category)

/**
 *  创建由颜色生成的图片
 *
 *  @param color 生成图片的色值
 *
 *  @param rect  图片的frame设置
 *
 *  @param roundSize 图片的圆角大小
 *
 *  @param corners 圆角的类型(左上,右上,左下,右下)
 *
 *  @param text 图片上的文字
 */
+ (UIImage *)creatImageWithCustomColor:(UIColor *)color rect:(CGRect)rect andRoundSize:(CGFloat)roundSize byRoundingCorners:(UIRectCorner)corners text:(NSString*)text;


/**
 *  设置图片的圆角及边框
 *
 *  @param radius 圆角大小
 *
 *  @param borderWidth 边框宽度
 *
 *  @param borderColor 边框颜色
 */
- (UIImage *)setImageWithRoundCornerRadius:(CGFloat)radius
                           borderWidth:(CGFloat)borderWidth
                           borderColor:(UIColor *)borderColor;

/**
 *  图片旋转角度
 *
 *  @param degrees 角度
 */
- (UIImage *) imageRotatedByDegrees:(CGFloat)degrees;

/**
 *  图片旋转 (效果自己Run)
 *
 *  @param horizontal 横向
 *
 *  @param vertical 竖向
 */
- (UIImage *)flipHorizontal:(BOOL)horizontal vertical:(BOOL)vertical;

/**
 *  玻璃化效果，这里与系统的玻璃化枚举效果一样，但只是一张图
 *
 *  @param type 玻璃化效果类型
 */
- (UIImage *)createImageWithBlur:(ImageBlurType)type;

/**
 *  玻璃化效果，这里与系统的玻璃化枚举效果一样，但只是一张图
 *
 *  @param tintColor 自定义玻璃化效果颜色
 */
- (UIImage *)imageByBlurWithTint:(UIColor *)tintColor;
/**
 *  自定义玻璃化效果，这里与系统的玻璃化枚举效果一样，但只是一张图;(自定义各种参数)
 */
- (UIImage *)imageByBlurRadius:(CGFloat)blurRadius
                     tintColor:(UIColor *)tintColor
                      tintMode:(CGBlendMode)tintBlendMode
                    saturation:(CGFloat)saturation
                     maskImage:(UIImage *)maskImage;

/**
 *  设置图片的模糊度
 *
 *  @param blur 模糊度0~1之间
 *
 *  @param exclusionPath 模糊路径(可不做设置)
 */
- (UIImage *) boxblurImageWithBlur:(CGFloat)blur exclusionPath:(UIBezierPath *)exclusionPath;

@end

