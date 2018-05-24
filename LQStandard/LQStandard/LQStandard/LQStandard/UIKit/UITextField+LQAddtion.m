//
//  UITextField+LQAddtion.m
//  足彩大赢家
//
//  Created by lequwuxian1 on 2017/12/13.
//  Copyright © 2017年 lequwuxian. All rights reserved.
//

#import "UITextField+LQAddtion.h"
#import "NSString+Predicate.h"

@implementation UITextField (LQAddtion)

- (NSInteger)inputConstraints:(NSInteger)number autoIntercept:(BOOL)autoIntercept whitespace:(BOOL)whitespace {
    NSString *oriStr = self.text;
    NSString *toBeString = whitespace ? [oriStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] : oriStr;
    NSString *lang = self.textInputMode.primaryLanguage;
    NSUInteger length = [toBeString stringByCalculatingStringLength];
    BOOL isFull = NO;
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange *selectedRange = [self markedTextRange];
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        if (!position) {
            if (autoIntercept && length > number) {
                self.text = [toBeString stringByCutingToIndex:number];
                isFull = YES;
            } else {
                isFull = NO;
            }
        }
    } else {
        if (autoIntercept && length > number) {
            self.text = [toBeString stringByCutingToIndex:number];
            isFull = YES;
        } else {
            isFull = NO;
        }
    }
    
    return isFull ? number : length;
}


@end
