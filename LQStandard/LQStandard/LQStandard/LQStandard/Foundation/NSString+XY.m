//
//  NSString+XY.m
//  JoinShow
//
//  Created by Heaven on 13-10-16.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import "NSString+XY.h"
#import "NSData+MC.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (XY)

@dynamic data;
@dynamic date;

//@dynamic MD5;
//@dynamic MD5Data;

@dynamic SHA1;

@dynamic APPEND;
@dynamic LINE;
@dynamic REPLACE;

- (NSData *)data
{
	return [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
}



- (NSStringAppendBlock)APPEND
{
	NSStringAppendBlock block = ^ NSString * ( id first, ... )
	{
		va_list args;
		va_start( args, first );
        
		NSString * append = [[NSString alloc] initWithFormat:first arguments:args];
		
		NSMutableString * copy = [self mutableCopy];
		[copy appendString:append];
        
		va_end( args );
		
		return copy;
	};
    
	return [block copy];
}

- (NSStringAppendBlock)LINE
{
	NSStringAppendBlock block = ^ NSString * ( id first, ... )
	{
		NSMutableString * copy = [self mutableCopy];
        
		if ( first )
		{
			va_list args;
			va_start( args, first );
			
			NSString * append = [[NSString alloc] initWithFormat:first arguments:args];
			[copy appendString:append];
            
			va_end( args );
		}
        
		[copy appendString:@"\n"];
        
		return copy;
	};
	
	return [block copy];
}

- (NSStringReplaceBlock)REPLACE
{
	NSStringReplaceBlock block = ^ NSString * ( NSString * string1, NSString * string2 )
	{
		return [self stringByReplacingOccurrencesOfString:string1 withString:string2];
	};
	
	return [block copy];
}
- (BOOL)empty
{
	return [self length] > 0 ? NO : YES;
}

- (BOOL)notEmpty
{
	return [self length] > 0 ? YES : NO;
}

- (BOOL)eq:(NSString *)other
{
	return [self isEqualToString:other];
}

- (BOOL)equal:(NSString *)other
{
	return [self isEqualToString:other];
}

- (BOOL)is:(NSString *)other
{
	return [self isEqualToString:other];
}

- (BOOL)isNot:(NSString *)other
{
	return NO == [self isEqualToString:other];
}

- (BOOL)isValueOf:(NSArray *)array
{
	return [self isValueOf:array caseInsens:NO];
}

- (BOOL)isValueOf:(NSArray *)array caseInsens:(BOOL)caseInsens
{
	NSStringCompareOptions option = caseInsens ? NSCaseInsensitiveSearch : 0;
	
	for ( NSObject * obj in array )
	{
		if ( NO == [obj isKindOfClass:[NSString class]] )
			continue;
		
		if ( [(NSString *)obj compare:self options:option] )
			return YES;
	}
	
	return NO;
}

- (NSString *)URLEncoding
{
    CFStringRef aCFString = CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault,
                                                                    (CFStringRef)self,
                                                                    NULL,
                                                                    (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                    kCFStringEncodingUTF8 );
	NSString * result = (NSString *)CFBridgingRelease(aCFString);
    CFRelease(aCFString);
    
	return result;
}

- (NSString *)URLDecoding
{
	NSMutableString * string = [NSMutableString stringWithString:self];
    [string replaceOccurrencesOfString:@"+"
							withString:@" "
							   options:NSLiteralSearch
								 range:NSMakeRange(0, [string length])];
    return [string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSMutableDictionary *)dictionaryFromQueryComponents
{
    NSMutableDictionary *queryComponents = [NSMutableDictionary dictionary];
    for(NSString *keyValuePairString in [self componentsSeparatedByString:@"&"])
    {
        NSArray *keyValuePairArray = [keyValuePairString componentsSeparatedByString:@"="];
        if ([keyValuePairArray count] < 2) continue; // Verify that there is at least one key, and at least one value.  Ignore extra = signs
        NSString *key = [[keyValuePairArray objectAtIndex:0] URLDecoding];
        NSString *value = [[keyValuePairArray objectAtIndex:1] URLDecoding];
        NSMutableArray *results = [queryComponents objectForKey:key]; // URL spec says that multiple values are allowed per key
        if(!results) // First object
        {
            results = [NSMutableArray arrayWithCapacity:1];
            [queryComponents setObject:results forKey:key];
        }
        [results addObject:value];
    }
    return queryComponents;
}
- (NSString *)stringMD5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)MD5
{
	NSData * value;
	
	value = [NSData dataWithBytes:[self UTF8String] length:[self length]];
	value = [value MD5];
    
	if ( value )
	{
		char			tmp[16];
		unsigned char *	hex = (unsigned char *)malloc( 2048 + 1 );
		unsigned char *	bytes = (unsigned char *)[value bytes];
		unsigned long	length = [value length];
		
		hex[0] = '\0';
		
		for ( unsigned long i = 0; i < length; ++i )
		{
			sprintf( tmp, "%02X", bytes[i] );
			strcat( (char *)hex, tmp );
		}
		
		NSString * result = [NSString stringWithUTF8String:(const char *)hex];
		free( hex );
		return result;
	}
	else
	{
		return nil;
	}
}

- (NSData *)MD5Data
{
	// TODO:
	return nil;
}

// thanks to @uxyheaven
- (NSString *)SHA1
{
    const char *	cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *		data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t			digest[CC_SHA1_DIGEST_LENGTH] = { 0 };
	CC_LONG			digestLength = (CC_LONG)data.length;
    
    CC_SHA1( data.bytes, digestLength, digest );
    
    NSMutableString * output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
	
    for ( int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++ )
	{
		[output appendFormat:@"%02x", digest[i]];
	}
    
    return output;
}

- (NSString *)trim
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)unwrap
{
	if ( self.length >= 2 )
	{
		if ( [self hasPrefix:@"\""] && [self hasSuffix:@"\""] )
		{
			return [self substringWithRange:NSMakeRange(1, self.length - 2)];
		}
        
		if ( [self hasPrefix:@"'"] && [self hasSuffix:@"'"] )
		{
			return [self substringWithRange:NSMakeRange(1, self.length - 2)];
		}
	}
    
	return self;
}

- (NSString *)repeat:(NSUInteger)count
{
	if ( 0 == count )
		return @"";
	
	NSMutableString * text = [NSMutableString string];
	
	for ( NSUInteger i = 0; i < count; ++i )
	{
		[text appendString:self];
	}
	
	return text;
}

- (NSString *)normalize
{
	return [self stringByReplacingOccurrencesOfString:@"//" withString:@"/"];
}


- (BOOL)isNormal{
    NSString *regex = @"([^%&',;=!~?$]+)";
	NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
	
	return [pred evaluateWithObject:self];
}

- (BOOL)isUserName
{
	NSString *		regex = @"(^[A-Za-z0-9]{3,20}$)";
	NSPredicate *	pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
	
	return [pred evaluateWithObject:self];
}

- (BOOL) isChineseUserName
{
	NSString *		regex = @"(^[A-Za-z0-9\u4e00-\u9fa5]{3,20}$)";
	NSPredicate *	pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
	
	return [pred evaluateWithObject:self];
}

- (BOOL)isPassword
{
	NSString *		regex = @"(^[A-Za-z0-9]{6,20}$)";
	NSPredicate *	pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
	
	return [pred evaluateWithObject:self];
}

- (BOOL)isEmail
{
	NSString *		regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
	NSPredicate *	pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
	
	return [pred evaluateWithObject:self];
}

- (BOOL)isUrl
{
    NSString *		regex = @"http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
	NSPredicate *	pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
	
	return [pred evaluateWithObject:self];
}

- (BOOL)isIPAddress
{
	NSArray *			components = [self componentsSeparatedByString:@"."];
	NSCharacterSet *	invalidCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
	
	if ( [components count] == 4 )
	{
		NSString *part1 = [components objectAtIndex:0];
		NSString *part2 = [components objectAtIndex:1];
		NSString *part3 = [components objectAtIndex:2];
		NSString *part4 = [components objectAtIndex:3];
		
		if ( [part1 rangeOfCharacterFromSet:invalidCharacters].location == NSNotFound &&
            [part2 rangeOfCharacterFromSet:invalidCharacters].location == NSNotFound &&
            [part3 rangeOfCharacterFromSet:invalidCharacters].location == NSNotFound &&
            [part4 rangeOfCharacterFromSet:invalidCharacters].location == NSNotFound )
		{
			if ( [part1 intValue] < 255 &&
                [part2 intValue] < 255 &&
                [part3 intValue] < 255 &&
                [part4 intValue] < 255 )
			{
				return YES;
			}
		}
	}
	
	return NO;
}

- (BOOL)isTelephone
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    return  [regextestmobile evaluateWithObject:self]   ||
    [regextestphs evaluateWithObject:self]      ||
    [regextestct evaluateWithObject:self]       ||
    [regextestcu evaluateWithObject:self]       ||
    [regextestcm evaluateWithObject:self];
}

////////////////////
- (BOOL)isHasCharacterAndNumber{
    BOOL isExistDigit = [self rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound;
    
    BOOL isExistLetter = [self rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]].location != NSNotFound;
    
    return isExistDigit && isExistLetter;
}
- (BOOL)isNickname{
    if (self == nil) {
		return NO;
	}
    
    NSString *regex = @"^[a-zA-Z0-9_\u4E00-\u9FFF-]{1,12}+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
	BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

- (BOOL)isTelephone2{
    if (self == nil)
        return NO;

	//联通号码
	NSString *regex_Unicom = @"^(130|131|132|133|185|186|156|155)[0-9]{8}";
	//移动号码
	NSString *regex_CMCC = @"^(134|135|136|137|138|139|147|150|151|152|157|158|159|182|187|188)[0-9]{8}";
	//电信号码段(电信新增号段181)
	NSString *regex_Telecom = @"^(133|153|180|181|189)[0-9]{8}";
	
	NSPredicate *pred_Unicom = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex_Unicom];
	BOOL isMatch_Unicom = [pred_Unicom evaluateWithObject:self];
	
	NSPredicate *pred_CMCC = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex_CMCC];
	BOOL isMatch_CMCC = [pred_CMCC evaluateWithObject:self];
	
	NSPredicate *pred_Telecom = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex_Telecom];
	BOOL isMatch_Telecom = [pred_Telecom evaluateWithObject:self];
	
	if (isMatch_Unicom || isMatch_CMCC || isMatch_Telecom)
    {
		return YES;
	}
	else
    {
        return NO;
	}
}
///////////////////
- (NSString *)substringUnicodeLength:(NSUInteger)length
{
    int i=0;
    int len = 0;
    while (i < self.length) {
        if ([self characterAtIndex:i] > 0xff) {
            len += 2;
        } else {
            len ++;
        }
        
        i++;
        if (i >= self.length) {
            
            return self;
        }
        
        if (len == length) {
            
            return [self substringToIndex:i];
            
        } else if (len > length) {
            
            if (i-1 <= 0) {
                return @"";
            }
            
            return [self substringToIndex:i-1];
        }
    }
    
    return self;
}


- (NSString *)substringFromIndex:(NSUInteger)from untilCharset:(NSCharacterSet *)charset
{
	return [self substringFromIndex:from untilCharset:charset endOffset:NULL];
}

- (NSString *)substringFromIndex:(NSUInteger)from untilCharset:(NSCharacterSet *)charset endOffset:(NSUInteger *)endOffset
{
	if ( 0 == self.length )
		return nil;
	
	if ( from >= self.length )
		return nil;
    
	NSRange range = NSMakeRange( from, self.length - from );
	NSRange range2 = [self rangeOfCharacterFromSet:charset options:NSCaseInsensitiveSearch range:range];
    
	if ( NSNotFound == range2.location )
	{
		if ( endOffset )
		{
			*endOffset = range.location + range.length;
		}
		
		return [self substringWithRange:range];
	}
	else
	{
		if ( endOffset )
		{
			*endOffset = range2.location + range2.length;
		}
        
		return [self substringWithRange:NSMakeRange(from, range2.location - from)];
	}
}

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
- (CGSize)sizeWithFont:(UIFont *)font byWidth:(CGFloat)width
{
    return [self calculateSize:CGSizeMake(width, 999999.0f) font:font];
}

- (CGSize)sizeWithFont:(UIFont *)font byHeight:(CGFloat)height
{
    return [self calculateSize:CGSizeMake(999999.0f, height) font:font];
}
#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

+ (NSString *)fromResource:(NSString *)resName
{
	NSString *	extension = [resName pathExtension];
	NSString *	fullName = [resName substringToIndex:(resName.length - extension.length - 1)];
    
	NSString * path = [[NSBundle mainBundle] pathForResource:fullName ofType:extension];
	return [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
}

- (BOOL)match:(NSString *)expression
{
	NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:expression
																			options:NSRegularExpressionCaseInsensitive
																			  error:nil];
	if ( nil == regex )
		return NO;
	
	NSUInteger numberOfMatches = [regex numberOfMatchesInString:self
														options:0
														  range:NSMakeRange(0, self.length)];
	if ( 0 == numberOfMatches )
		return NO;
    
	return YES;
}

- (BOOL)matchAnyOf:(NSArray *)array
{
	for ( NSString * str in array )
	{
		if ( NSOrderedSame == [self compare:str options:NSCaseInsensitiveSearch] )
		{
			return YES;
		}
	}
	
	return NO;
}

- (NSInteger)getLength
{
    NSInteger strLength = 0;

    for (int i = 0; i < self.length; i++) {
        if ([self characterAtIndex:i] > 0xff) {
            strLength += 2;
        } else {
            strLength ++;
        }
    }
    return strLength;
}

- (NSInteger)getLength2{
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData *data = [self dataUsingEncoding:enc];
    return [data length];
}

- (NSString *)replaceUnicode
{
    NSString *tempStr1 = [self stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString* returnStr = nil;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:NULL error:NULL];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                         mutabilityOption:NSPropertyListImmutable
                                                   format:NULL
                                         errorDescription:NULL];
#pragma clang diagnostic pop
    }
    //  NSLog(@"%@",returnStr);
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}

- (void)erasure{
    char *string = (char *)CFStringGetCStringPtr((CFStringRef)self, CFStringGetSystemEncoding());
    memset(string, 0, [self length]);
}

- (NSString*)stringByInitials{
    NSMutableString *result = [NSMutableString string];
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationByWords | NSStringEnumerationLocalized usingBlock:^(NSString *word, NSRange wordRange, NSRange enclosingWordRange, BOOL *stop1) {
        __block NSString *firstLetter = nil;
        [self enumerateSubstringsInRange:NSMakeRange(0, word.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *letter, NSRange letterRange, NSRange enclosingLetterRange, BOOL *stop2) {
            firstLetter = letter;
            *stop2 = YES;
        }];
        if (firstLetter != nil) {
            [result appendString:firstLetter];
        };
    }];
    return result;
}
- (CGSize)calculateSize:(CGSize)size font:(UIFont *)font lineBreak:(NSLineBreakMode)breakMode
{
    CGSize expectedLabelSize = CGSizeZero;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = breakMode;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        
        expectedLabelSize = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        expectedLabelSize = [self sizeWithFont:font
                             constrainedToSize:size
                                 lineBreakMode:breakMode];
#pragma  clang diagnostic pop
    }
    
    return CGSizeMake(ceil(expectedLabelSize.width), ceil(expectedLabelSize.height));
}
- (CGSize)calculateSize:(CGSize)size font:(UIFont *)font
{
    return [self calculateSize:size font:font lineBreak:NSLineBreakByCharWrapping];
}

- (NSTimeInterval) displayTime
{
    return MAX((float)self.length * 0.1 + 2, 2);
}

- (NSMutableAttributedString *)getAttributedWithColor:(UIColor *)defaultColor
                                          defaultFont:(UIFont *)defaultFont
                                           attrString:(NSString *)attrString
                                            attrColor:(UIColor *)attrColor
                                             attrFont:(UIFont *)attrFont
{    
    NSRange attributeRange = [self rangeOfString:attrString];
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    // font
    [attributedStr addAttribute:NSFontAttributeName
                          value:(id)defaultFont
                          range:NSMakeRange(0, self.length)];
    [attributedStr addAttribute:NSFontAttributeName
                          value:(id)attrFont
                          range:attributeRange];
    
    // color
    [attributedStr addAttribute:NSForegroundColorAttributeName
                          value:(id)defaultColor
                          range:NSMakeRange(0, self.length)];
    [attributedStr addAttribute:NSForegroundColorAttributeName
                          value:(id)attrColor
                          range:attributeRange];
    
    return attributedStr;
}



@end

#pragma mark -

@implementation NSMutableString(BeeExtension)

@dynamic APPEND;
@dynamic LINE;
@dynamic REPLACE;

- (NSMutableStringAppendBlock)APPEND
{
	NSMutableStringAppendBlock block = ^ NSMutableString * ( id first, ... )
	{
		va_list args;
		va_start( args, first );
		
		NSString * append = [[NSString alloc] initWithFormat:first arguments:args];
		[self appendString:append];
		
		va_end( args );
        
		return self;
	};
	
	return [block copy] ;
}

- (NSMutableStringAppendBlock)LINE
{
	NSMutableStringAppendBlock block = ^ NSMutableString * ( id first, ... )
	{
		if ( first )
		{
			va_list args;
			va_start( args, first );
			
			NSString * append = [[NSString alloc] initWithFormat:first arguments:args];
			[(NSMutableString *)self appendString:append];
			
			va_end( args );
		}
		
		[(NSMutableString *)self appendString:@"\n"];
        
		return self;
	};
	
	return [block copy] ;
}

- (NSMutableStringReplaceBlock)REPLACE
{
	NSMutableStringReplaceBlock block = ^ NSMutableString * ( NSString * string1, NSString * string2 )
	{
		[self replaceOccurrencesOfString:string1
							  withString:string2
								 options:NSCaseInsensitiveSearch
								   range:NSMakeRange(0, self.length)];
		
		return self;
	};
	
	return [block copy] ;
}

@end
