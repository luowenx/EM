//
//  UIImage+Comm.m
//  testone
//
//  Created by Jackalsen on 13-8-29.
//  Copyright (c) 2013年 dr。xu. All rights reserved.
//

#import "UIImage+Comm.h"

@implementation UIImage (Comm)

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1

#define kCGImageAlphaPremultipliedFirst  (kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedFirst)

#else

#define kCGImageAlphaPremultipliedFirst  kCGImageAlphaPremultipliedFirst

#endif

//+(UIImage *)addText:(UIImage *)img text:(NSString *)text1
//{
//    //get image width and height
//    int w = img.size.width;
//    int h = img.size.height;
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    //create a graphic context with CGBitmapContextCreate
//    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
//    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
//    CGContextSetRGBFillColor(context, 0.0, 1.0, 1.0, 1);
//    char* text = (char *)[text1 cStringUsingEncoding:NSASCIIStringEncoding];
//    CGContextSelectFont(context, "Georgia", 50, kCGEncodingMacRoman);
//    CGContextSetTextDrawingMode(context, kCGTextFill);
//    CGContextSetRGBFillColor(context, 255, 0, 0, 1);
//    CGContextShowTextAtPoint(context, w/2-strlen(text)*5, h/2, text, strlen(text));
//    //Create image ref from the context
//    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
//    CGContextRelease(context);
//    CGColorSpaceRelease(colorSpace);
//    UIImage *image  = [UIImage imageWithCGImage:imageMasked];
//    CGImageRelease(imageMasked);
//
//    return image;
//}

+(UIImage *)addImageLogo:(UIImage *)img text:(UIImage *)logo
{
    //get image width and height
    int w = img.size.width;
    int h = img.size.height;
    int logoWidth = logo.size.width;
    int logoHeight = logo.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //create a graphic context with CGBitmapContextCreate
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGContextDrawImage(context, CGRectMake(w-logoWidth, 0, logoWidth, logoHeight), [logo CGImage]);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    UIImage *image  = [UIImage imageWithCGImage:imageMasked];
    CGImageRelease(imageMasked);
    
    return image;
    //  CGContextDrawImage(contextRef, CGRectMake(100, 50, 200, 80), [smallImg CGImage]);
}

+ (UIImage *)addImage:(UIImage *)useImage addImage1:(UIImage *)addImage1
{
    UIGraphicsBeginImageContext(useImage.size);
    [useImage drawInRect:CGRectMake(0, 0, useImage.size.width, useImage.size.height)];
    [addImage1 drawInRect:CGRectMake(0, useImage.size.height-addImage1.size.height, addImage1.size.width, addImage1.size.height)];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}
+(UIImage*)image:(UIImage *)finalImg image:(UIImage *)srcImg finalSize:(CGSize)finalSize srcSize:(CGSize)srcSize srcPoint:(CGPoint)srcPoint{
    UIGraphicsBeginImageContext(finalSize);
    [finalImg drawInRect:CGRectMake(0,0,finalSize.width,finalSize.height)];
    [srcImg drawInRect:CGRectMake(srcPoint.x,srcPoint.y,srcSize.width ,srcSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+(UIImage*)image:(UIImage*)img stretchW:(NSInteger)w stretchH:(NSInteger)h
{
   return [img stretchableImageWithLeftCapWidth:w topCapHeight:h];
}

- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize
{
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth= width * scaleFactor;
        scaledHeight = height * scaleFactor;
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if (widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    [sourceImage drawInRect:thumbnailRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
        NSLog(@"could not scale image");
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


- (UIImage *)fixOrientation {
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [self drawInRect:(CGRect){0, 0, self.size}];
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}

- (UIImage *)scaleToMainScreenSize
{
    CGFloat scale = 1;
    if (self.size.width > self.size.height) {
        scale = [[UIScreen mainScreen] bounds].size.width/self.size.width;
    } else {
        scale = ([[UIScreen mainScreen] bounds].size.height - 20)/self.size.height;
    }
    if (scale > 1) {
        return self;
    }
    CGSize size = CGSizeZero;
    size.width  = scale*self.size.width;
    size.height = scale*self.size.height;
    
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}


+ (BOOL)isJPEGWithData:(NSData *)data
{
    if ([data length] < 4) {
        return NO;
    }
    
    const unsigned char * bytes = (const unsigned char *)[data bytes];
    if (bytes[0] != 0xFF || bytes[1] != 0xD8) {
         return NO;
    }
    
    if (bytes[[data length] - 2] != 0xFF || bytes[[data length] - 1] != 0xD9) {
        return NO;
    }
    
    return YES;
}

//截取部分图像
-(UIImage*)getSubImage:(CGRect)rect
{
    CGImageRef subImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    return smallImage;
}

//等比例缩放
-(UIImage*)scaleToSize:(CGSize)size
{
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    
    float verticalRadio = size.height*1.0/height;
    float horizontalRadio = size.width*1.0/width;
    
    float radio = 1;
    if(verticalRadio>1 && horizontalRadio>1)
    {
        radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio;
    }
    else
    {
        radio = verticalRadio < horizontalRadio ? verticalRadio : horizontalRadio;
    }
    
    width = width*radio;
    height = height*radio;
    
    int xPos = (size.width - width)/2;
    int yPos = (size.height-height)/2;
    
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    
    // 绘制改变大小的图片
    [self drawInRect:CGRectMake(xPos, yPos, width, height)];
    
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    
    // 返回新的改变大小后的图片
    return scaledImage;
}



+(UIImage *)imageFromColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f,0.0f,1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *myImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return myImage;
}
@end
