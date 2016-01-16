//
//  UIFont+WWFont.m
//  WakeWake
//
//  Created by Bruno Isola Reginato on 11/2/15.
//  Copyright (c) 2015 BReginato. All rights reserved.
//

#import "UIFont+WWFont.h"

@implementation UIFont (WWFont)

NSString *const kBaseFontFamily = @"Helvetica";

NSString *const kBaseBoldFontFamily = @"Helvetica bold";

NSInteger const kMicroFontSize = 12;
NSInteger const kSmallFontSize = 16;
NSInteger const kMediumFontSize = 20;
NSInteger const kLargeFontSize = 28;

+(UIFont *)WWmicroFont {
    return [UIFont fontWithName:kBaseFontFamily size:kMicroFontSize];
}

+(UIFont *)WWsmallFontSize {
    return [UIFont fontWithName:kBaseFontFamily size:kSmallFontSize];
}

+(UIFont *)WWmediumFontSize {
    return [UIFont fontWithName:kBaseFontFamily size:kMediumFontSize];
}

+(UIFont *)WWlargeFontSize {
    return [UIFont fontWithName:kBaseFontFamily size:kLargeFontSize];
}

+(UIFont *)WWmicroFontBold {
    return [UIFont fontWithName:kBaseBoldFontFamily size:kMicroFontSize];
}

+(UIFont *)WWsmallFontBold {
    return [UIFont fontWithName:kBaseBoldFontFamily size:kSmallFontSize];
}

+(UIFont *)WWmediumFontBold {
    return [UIFont fontWithName:kBaseBoldFontFamily size:kMediumFontSize];
}

+(UIFont *)WWlargeFontBold {
    return [UIFont fontWithName:kBaseBoldFontFamily size:kLargeFontSize];
}

@end
