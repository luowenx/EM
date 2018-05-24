//
//  UIIamge+Compress.m
//  TingTing
//
//  Created by lc on 13-5-23.
//  Copyright (c) 2013年 lc. All rights reserved.
//

#import "UIIamge+Compress.h"
#import <ImageIO/ImageIO.h>

#define MAX_IMAGEPIX 568.0          // max pix 200.0px
#define MAX_IMAGEDATA_LEN 50000.0   // max data length 5K

@implementation UIImage (Compress)

- (UIImage *)compressedImage {
    CGSize imageSize = self.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    if (width <= MAX_IMAGEPIX && height <= MAX_IMAGEPIX) {
        // no need to compress.
        return self;
    }
    
    if (width == 0 || height == 0) {
        // void zero exception
        return self;
    }
    
    UIImage *newImage = nil;
    CGFloat widthFactor = MAX_IMAGEPIX / width;
    CGFloat heightFactor = MAX_IMAGEPIX / height;
    CGFloat scaleFactor = 0.0;
    
    if (widthFactor > heightFactor)
        scaleFactor = heightFactor; // scale to fit height
    else
        scaleFactor = widthFactor; // scale to fit width
    
    CGFloat scaledWidth  = width * scaleFactor;
    CGFloat scaledHeight = height * scaleFactor;
    CGSize targetSize = CGSizeMake(scaledWidth, scaledHeight);
    
//    UIGraphicsBeginImageContext(targetSize);
    UIGraphicsBeginImageContextWithOptions(targetSize, NO, self.scale);
    [self drawInRect:CGRectMake(0, 0, targetSize.width, targetSize.height)];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

- (NSData *)compressedData:(CGFloat)compressionQuality {
    assert(compressionQuality <= 1.0 && compressionQuality >= 0);
    
    return UIImageJPEGRepresentation(self, compressionQuality);
}

- (CGFloat)compressionQuality {
    NSData *data = UIImageJPEGRepresentation(self, 1.0);
    NSUInteger dataLength = [data length];
    
    if(dataLength > MAX_IMAGEDATA_LEN) {
        return 1.0 - MAX_IMAGEDATA_LEN / dataLength;
    } else {
        return 1.0;
    }
}

- (NSData *)compressedData {
    CGFloat quality = [self compressionQuality];
    
    return [self compressedData:quality];
}


- (NSData *)compressedDataToMaxLength{
    NSData *data =  UIImageJPEGRepresentation(self, 1.0);
    CGFloat quality = 1.0f;
    while (data.length > MAX_IMAGEDATA_LEN) {
        quality = quality * 0.9;
        data = UIImageJPEGRepresentation(self, quality);
    }
    return data;
}

- (NSData *)compressedDataToSize:(CGFloat)size {
    CGFloat compressionQuality = 1.f;
    NSData* imageData = UIImageJPEGRepresentation(self, compressionQuality);
    while (imageData.length > size * 1024) {
        compressionQuality -= 0.1;
        if (compressionQuality < 0.1) {
            break;
        }
        imageData = UIImageJPEGRepresentation(self, compressionQuality);
    }
    
    return imageData;
}

@end
