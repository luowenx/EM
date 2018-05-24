//
//  UIIamge+Compress.h
//  TingTing
//
//  Created by lc on 13-5-23.
//  Copyright (c) 2013年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Compress)

- (UIImage *)compressedImage;

- (CGFloat)compressionQuality;

- (NSData *)compressedData;

- (NSData *)compressedData:(CGFloat)compressionQuality;

- (NSData *)compressedDataToMaxLength;

- (NSData *)compressedDataToSize:(CGFloat)size;

@end
