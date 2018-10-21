
//
//  UsefulHeader.h
//  UsefulCategory
//  GitHub地址: https://github.com/LuochuanAD/UsefulCategory
//  Created by care on 2018/4/2.
//  Copyright © 2018年 luochuan. All rights reserved.
//

#ifndef UsefulHeader_h
#define UsefulHeader_h

/*
 *  WINDOWS 屏幕宽高 (包括横竖屏)
 */
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
#define WINDOWS_WIDTH ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.width)
#define WINDOWS_HEIGHT ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.height)
#define WINDOWS ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale):[UIScreen mainScreen].bounds.size)
#else
#define WINDOWS_WIDTH [UIScreen mainScreen].bounds.size.width
#define WINDOWS_HEIGHT [UIScreen mainScreen].bounds.size.height
#define WINDOWS [UIScreen mainScreen].bounds.size
#endif

/*
 *  设备类型
 */
#define iPhone4_4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5_5s_5c_se ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6_6s_7_8 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6p_6sp_7p_8p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define is_iPhoneXSeries ((int)((SCREEN_HEIGHTL/SCREEN_WIDTHL)*100) == 216)?YES:NO

#define ISIPAD ([[UIDevice currentDevice] userInterfaceIdiom]==UIUserInterfaceIdiomPad)
#define ISIPHONE   ([[UIDevice currentDevice] userInterfaceIdiom]==UIUserInterfaceIdiomPhone)
/*
 *  TABBARHEIGHT tabbar高度;NAVIGATIONBARHEIGHT 导航栏高度
 */
#define TABBARHEIGHT (is_iPhoneXSeries?83:49)
#define NAVIGATIONBARHEIGHT (is_iPhoneXSeries?88:64)

/*
 *  ColorHex 16进制颜色(example:ColorHex(0xe5e5e5))
 *  RGBA rgba颜色
 */
#define ColorHex(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
/*
 *  SLog  NSLog封装宏
 */
#define SLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )

/*
 *  AppCurrentLanguage APP当前语言
 */
#define AppCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

/*
 *  WeakSelf 弱引用;StrongSelf 强引用
 */
#define WeakSelf        @weakify(self);
#define StrongSelf      @strongify(self);
#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) strong##_##object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) block##_##object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) strong##_##object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) block##_##object = block##_##object;
#endif
#endif
#endif

/*
 *  GCD_ONCE_BLOCK 单例;
 */
#define GCD_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
/*
 *  GCD_MAIN_THREAD 主线程;
 */
#define GCD_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
/*
 *  GCD_GLOBAL_QUEUE_DEFAULT 子线程;
 */
#define GCD_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);
/*
 *  GCD_MAIN_DELAY 不堵塞线程并在主线程的延迟执行
 */
#define GCD_MAIN_DELAY(timer,block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, INT64_C(timer) * NSEC_PER_SEC), dispatch_get_main_queue(), block)
/*
 *  StringIsEmpty 字符串是否为空
 */
#define StringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
/*
 *  ArrayIsEmpty 数组是否为空
 */
#define ArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
/*
 *  DictIsEmpty 字典是否为空
 */
#define DictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
/*
 *  ObjectIsEmpty 对象是否为空
 */
#define ObjectIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))
/*
 *  FONT 字体大小
 */
#define FONT(F) [UIFont fontWithName:@"FZHTJW--GB1-0" size:F]

#endif /* UsefulHeader_h */
