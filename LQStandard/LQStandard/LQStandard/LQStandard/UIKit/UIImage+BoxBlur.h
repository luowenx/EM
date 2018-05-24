//
//  UIImage+BoxBlur.h
//  LiveBlurView
//
//  Created by Alex Usbergo on 7/3/13.
//  Copyright (c) 2013 Alex Usbergo. All rights reserved.
//
// algorithm from: http://indieambitions.com/idevblogaday/perform-blur-vimage-accelerate-framework-tutorial/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+IndieAmbitions+%28Indie+Ambitions%29


#import <UIKit/UIKit.h>

@interface UIImage (BoxBlur)

/*************************毛玻璃效果****************************/

/* blur the current image with a box blur algoritm */
- (UIImage*)drn_boxblurImageWithBlur:(CGFloat)blur;

/* blur the current image with a box blur algoritm and tint with a color */
- (UIImage*)drn_boxblurImageWithBlur:(CGFloat)blur withTintColor:(UIColor*)tintColor;

- (UIImage*)boxblurImage;
/*************************映射效果****************************/
- (UIImage *)reflectionWithHeight:(int)height;
- (UIImage *)reflectionWithAlpha:(float)pcnt;
- (UIImage *)reflectionRotatedWithAlpha:(float)pcnt;

@end
