//
//  UIColor+GeneralColor.m
//  Fruit
//
//  Created by ༺ོ࿆强ོ࿆ ༻ on 2020/2/2.
//  Copyright © 2020 ༺ོ࿆强ོ࿆ ༻. All rights reserved.
//

#import "UIColor+GeneralColor.h"


@implementation UIColor (GeneralColor)
+ (nonnull instancetype)colorWithHex:(u_int32_t)hex {
    return  [self colorWithHex:hex alpha:1.0f];
}
+ (nonnull instancetype)colorWithHex:(u_int32_t)hex alpha:(CGFloat)alpha {
    u_int8_t red        = (hex & 0xFF0000) >> 16;
    u_int8_t green      = (hex & 0x00FF00) >> 8;
    u_int8_t blue       = hex & 0x0000FF;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


//+ (nonnull instancetype)colorWithRed:(u_int8_t)red green:(u_int8_t)green blue:(u_int8_t)blue alpha:(CGFloat)alpha {
//    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
//}
+ (nonnull instancetype)randomColor{
    u_int8_t red        = arc4random_uniform(256);
    u_int8_t green      = arc4random_uniform(256);
    u_int8_t blue       = arc4random_uniform(256);
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

+ (nullable instancetype)gradientFromColor:(nullable UIColor *)fromColor toColor:(nullable UIColor *)toColor withSize:(CGSize)size{
    if (size.width < 1) {
        size.width  = 1;
    }
    if (size.height < 1) {
        size.height = 1;
    }
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context        = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace  = CGColorSpaceCreateDeviceRGB();
    NSArray *colors             = [NSArray arrayWithObjects:(__bridge id)fromColor.CGColor , (__bridge id)toColor.CGColor, nil];
    const CGFloat locations[]   = {0.0, 1.0};
    CGGradientRef grasient      = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)colors, locations);
    CGContextDrawLinearGradient(context, grasient, CGPointMake(0, 0), CGPointMake(size.width, size.height), 0);
    UIImage *image              = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(grasient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    return [UIColor colorWithPatternImage:image];
}
#pragma mark - 颜色值
- (u_int8_t)redColorValue {
    return [self getRGBComponents][0] * 255.0 / [self alphaValue];
}
- (u_int8_t)greenColorValue {
  return [self getRGBComponents][1] * 255.0 / [self alphaValue];
}
- (u_int8_t)blueColorValue {
  return [self getRGBComponents][2] * 255.0 / [self alphaValue];
}
- (CGFloat)alphaValue {
    
    return [self getRGBComponents][3];
}
//UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
- (const CGFloat *)getRGBComponents {
    static CGFloat  components[4];
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char resultingPixel[4];
    CGContextRef context          = CGBitmapContextCreate(&resultingPixel,
                                                                        1,
                                                                        1,
                                                                        8,
                                                                        4,
                                                                        rgbColorSpace,
                                                                        (CGBitmapInfo)kCGImageAlphaNoneSkipLast);
    CGContextSetFillColorWithColor(context, self.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextRelease(context);
    CGColorSpaceRelease(rgbColorSpace);
    for (int component = 0; component < 4; component++) {
        components[component]   = resultingPixel[component] / 255.0f;
    }
    return components;
}




+ (nullable instancetype)getColor:(nullable NSString *)hexColor{
    NSString *colorString = [[hexColor stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if (colorString.length < 6) {
        return [UIColor clearColor];
    }
    
    if ([colorString hasPrefix:@"0X"] ||[colorString hasPrefix:@"0x"]) {
        colorString = [colorString substringFromIndex:2];
    }
    
    if ([colorString hasPrefix:@"#"]) {
        colorString = [colorString substringFromIndex:1];
    }
    
    if (colorString.length != 6) {
        return [UIColor clearColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    // r
    NSString *rString = [colorString substringWithRange:range];
    
    // g
    range.location = 2;
    NSString *gString = [colorString substringWithRange:range];
    
    // b
    range.location = 4;
    NSString *bString = [colorString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:(float)r / 255.0 green:(float)g / 255.0 blue:(float)b / 255.0 alpha:1.0];
}
+ (nullable instancetype)getColor:(nullable NSString *)hexColor alpha:(CGFloat)alpha {
   return [[self getColor:hexColor] colorWithAlphaComponent:alpha];
}




@end
