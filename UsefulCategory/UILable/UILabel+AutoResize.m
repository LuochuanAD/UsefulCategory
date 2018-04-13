//
//  UILabel+AutoResize.m
//  UsefulCategory
//  GitHub地址: https://github.com/LuochuanAD/UsefulCategory
//  Created by care on 2018/4/3.
//  Copyright © 2018年 luochuan. All rights reserved.
//


#import "UILabel+AutoResize.h"

@implementation UILabel (AutoResize)

- (void)setAutoResizeWithText:(NSString*)text {
    CGFloat savedWidth = self.frame.size.width;
    [self setAutoResizeWithText:text constrainedToSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)];
    CGRect frame = self.frame;
    frame.size.width = savedWidth;
    self.frame = frame;
}

- (void)setAutoResizeWithText:(NSString*)text constrainedToSize:(CGSize)constrainedToSize {
    if (text && text.length > 0) {
        CGRect frame = self.frame;
        NSDictionary *dicttitleFont=[NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, nil];
        CGRect titleFrame=[text boundingRectWithSize:constrainedToSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dicttitleFont context:nil];
        CGSize titleSize=titleFrame.size;
        
        frame.size = titleSize;
        self.frame = frame;
    }
    
    self.text = text;
}

@end
