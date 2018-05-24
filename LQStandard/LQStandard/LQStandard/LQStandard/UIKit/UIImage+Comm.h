//
//  UIImage+Comm.h
//  testone
//
//  Created by Jackalsen on 13-8-29.
//  Copyright (c) 2013年 dr。xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Comm)
//水印加文字
//+(UIImage *)addText:(UIImage *)img text:(NSString *)text;
//水印加图片
+(UIImage *)addImageLogo:(UIImage *)img text:(UIImage *)logo;
//半透明水印
+ (UIImage *)addImage:(UIImage *)useImage addImage1:(UIImage *)addImage;
//图片拉升
+(UIImage*)image:(UIImage*)img stretchW:(NSInteger)w stretchH:(NSInteger)h;
//图片合并
+(UIImage*)image:(UIImage *)finalImg image:(UIImage *)srcImg finalSize:(CGSize)finalSize srcSize:(CGSize)srcSize srcPoint:(CGPoint)srcPoint;
//传入size,可以将当前UIImage原比例缩放
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
//color to image
+ (UIImage *)imageWithColor:(UIColor *)color;

//图片重绘
- (UIImage *)fixOrientation;
- (UIImage *)scaleToMainScreenSize;

//JPEG图片完整性检查
+ (BOOL)isJPEGWithData:(NSData *)data;



+(UIImage *)imageFromColor:(UIColor *)color;


//截取部分图像
-(UIImage*)getSubImage:(CGRect)rect;


//等比例缩放
-(UIImage*)scaleToSize:(CGSize)size;


@end
