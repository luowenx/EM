//
//  UIFont+EMtandard.h
//  EMtandard
//
//

#import <UIKit/UIKit.h>

/**
 *  note: 文本中文字体参数获取 大小:max 36 huge 24, large 18, normal 16, small 14, min 12 tiny 11 minimum 10
 */
@interface UIFont (EMtandard)

//细黑
+(UIFont *)emFontMax;
+(UIFont *)emFontHuge;
+(UIFont *)emFontMedium;
+(UIFont *)emFontLarge;
+(UIFont *)emFontNormal;
+(UIFont *)emFontSmall;
+(UIFont *)emFontSmaller;
+(UIFont *)emFontMini;
+(UIFont *)emFontTiny;
+(UIFont *)emFontMinimum;

//粗体
+(UIFont *)emFontBoldMax;
+(UIFont *)emFontBoldHuge;
+(UIFont *)emFontBoldMedium;
+(UIFont *)emFontBoldLarge;
+(UIFont *)emFontBoldNormal;
+(UIFont *)emFontBoldSmall;
+(UIFont *)emFontBoldSmaller;
+(UIFont *)emFontBoldMini;
+(UIFont *)emFontBoldTiny;
+(UIFont *)emFontBoldMinimum;

/**
 *  使用非规范情况下的字体
 *
 *  @param fontSize 字体大小
 *  @param aIsBold  是否粗
 *
 *  @return <#return value description#>
 */
+(UIFont *)emFontOfSize:(CGFloat)fontSize isBold:(BOOL)aIsBold;

@end
