//
//  PESColorList.m
//  PESHandler
//
//  Created by Raphael Schweikert on 17.04.11.
//  Copyright 2011 Raphael Schweikert. All rights reserved.
//

#import "PESColorList.h"

@interface PESColorList () {
}
#if TARGET_OS_MAC
+ (NSColor *) colorForRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
#endif

#if TARGET_OS_IPHONE
+ (UIColor *) colorForRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
#endif
@end

@implementation PESColorList

#if TARGET_OS_MAC
+ (NSColor *) colorWithColorNumber:(NSUInteger)num {
#elif TARGET_OS_IPHONE
+ (UIColor *) colorWithColorNumber:(NSUInteger)num {
#endif
	switch (num) {
	case 1:	
		return [PESColorList colorForRed:0.054901960784313725f green:0.12156862745098039f blue:0.48627450980392156f];
	case 2:
		return [PESColorList colorForRed:0.0392156862745098f green:0.3333333333333333f blue:0.6392156862745098f];
	case 3:
		return [PESColorList colorForRed:0.18823529411764706f green:0.5294117647058824f blue:0.4666666666666667f];
	case 4:
		return [PESColorList colorForRed:0.29411764705882354f green:0.4196078431372549f blue:0.6862745098039216f];
	case 5:
		return [PESColorList colorForRed:0.9294117647058824f green:0.09019607843137255f blue:0.12156862745098039f];
	case 6:
		return [PESColorList colorForRed:0.8196078431372549f green:0.3607843137254902f blue:0.0f];
	case 7:
		return [PESColorList colorForRed:0.5686274509803921f green:0.21176470588235294f blue:0.592156862745098f];
	case 8:
		return [PESColorList colorForRed:0.8941176470588236f green:0.6039215686274509f blue:0.796078431372549f];
	case 9:
		return [PESColorList colorForRed:0.5686274509803921f green:0.37254901960784315f blue:0.6745098039215687f];
	case 10:
		return [PESColorList colorForRed:0.615686274509804f green:0.8392156862745098f blue:0.49019607843137253f];
	case 11:
		return [PESColorList colorForRed:0.9098039215686274f green:0.6627450980392157f blue:0.0f];
	case 12:
		return [PESColorList colorForRed:0.996078431372549f green:0.7294117647058823f blue:0.20784313725490197f];
	case 13:
		return [PESColorList colorForRed:1.0f green:1.0f blue:0.0f];
	case 14:
		return [PESColorList colorForRed:0.4392156862745098f green:0.7372549019607844f blue:0.12156862745098039f];
	case 15:
		return [PESColorList colorForRed:0.7529411764705882f green:0.5803921568627451f blue:0.0f];
	case 16:
		return [PESColorList colorForRed:0.6588235294117647f green:0.6588235294117647f blue:0.6588235294117647f];
	case 17:
		return [PESColorList colorForRed:0.4823529411764706f green:0.43529411764705883f blue:0.0f];
	case 18:
		return [PESColorList colorForRed:1.0f green:1.0f blue:0.7019607843137254f];
	case 19:
		return [PESColorList colorForRed:0.30980392156862746f green:0.3333333333333333f blue:0.33725490196078434f];
	case 20:
		return [PESColorList colorForRed:0.0f green:0.0f blue:0.0f];
	case 21:
		return [PESColorList colorForRed:0.043137254901960784f green:0.23921568627450981f blue:0.5686274509803921f];
	case 22:
		return [PESColorList colorForRed:0.4666666666666667f green:0.00392156862745098f blue:0.4627450980392157f];
	case 23:
		return [PESColorList colorForRed:0.1607843137254902f green:0.19215686274509805f blue:0.2f];
	case 24:
		return [PESColorList colorForRed:0.16470588235294117f green:0.07450980392156863f blue:0.00392156862745098f];
	case 25:
		return [PESColorList colorForRed:0.9647058823529412f green:0.2901960784313726f blue:0.5411764705882353f];
	case 26:
		return [PESColorList colorForRed:0.6980392156862745f green:0.4627450980392157f blue:0.1411764705882353f];
	case 27:
		return [PESColorList colorForRed:0.9882352941176471f green:0.7333333333333333f blue:0.7686274509803922f];
	case 28:
		return [PESColorList colorForRed:0.996078431372549f green:0.21568627450980393f blue:0.058823529411764705f];
	case 29:
		return [PESColorList colorForRed:0.9411764705882353f green:0.9411764705882353f blue:0.9411764705882353f];
	case 30:
		return [PESColorList colorForRed:0.41568627450980394f green:0.10980392156862745f blue:0.5411764705882353f];
	case 31:
		return [PESColorList colorForRed:0.6588235294117647f green:0.8666666666666667f blue:0.7686274509803922f];
	case 32:
		return [PESColorList colorForRed:0.1450980392156863f green:0.5176470588235295f blue:0.7333333333333333f];
	case 33:
		return [PESColorList colorForRed:0.996078431372549f green:0.7019607843137254f blue:0.2627450980392157f];
	case 34:
		return [PESColorList colorForRed:1.0f green:0.9411764705882353f blue:0.5529411764705883f];
	case 35:
		return [PESColorList colorForRed:0.8156862745098039f green:0.6509803921568628f blue:0.3764705882352941f];
	case 36:
		return [PESColorList colorForRed:0.8196078431372549f green:0.32941176470588235f blue:0.0f];
	case 37:
		return [PESColorList colorForRed:0.4f green:0.7294117647058823f blue:0.28627450980392155f];
	case 38:
		return [PESColorList colorForRed:0.07450980392156863f green:0.2901960784313726f blue:0.27450980392156865f];
	case 39:
		return [PESColorList colorForRed:0.5294117647058824f green:0.5294117647058824f blue:0.5294117647058824f];
	case 40:
		return [PESColorList colorForRed:0.8470588235294118f green:0.792156862745098f blue:0.7764705882352941f];
	case 41:
		return [PESColorList colorForRed:0.2627450980392157f green:0.33725490196078434f blue:0.027450980392156862f];
	case 42:
		return [PESColorList colorForRed:0.996078431372549f green:0.8901960784313725f blue:0.7725490196078432f];
	case 43:
		return [PESColorList colorForRed:0.9764705882352941f green:0.5764705882352941f blue:0.7372549019607844f];
	case 44:
		return [PESColorList colorForRed:0.0f green:0.2196078431372549f blue:0.13333333333333333f];
	case 45:
		return [PESColorList colorForRed:0.6980392156862745f green:0.6862745098039216f blue:0.8313725490196079f];
	case 46:
		return [PESColorList colorForRed:0.40784313725490196f green:0.41568627450980394f blue:0.6901960784313725f];
	case 47:
		return [PESColorList colorForRed:0.9372549019607843f green:0.8901960784313725f blue:0.7254901960784313f];
	case 48:
		return [PESColorList colorForRed:0.9686274509803922f green:0.2196078431372549f blue:0.4f];
	case 49:
		return [PESColorList colorForRed:0.7098039215686275f green:0.2980392156862745f blue:0.39215686274509803f];
	case 50:
		return [PESColorList colorForRed:0.07450980392156863f green:0.16862745098039217f blue:0.10196078431372549f];
	case 51:
		return [PESColorList colorForRed:0.7803921568627451f green:0.00392156862745098f blue:0.3333333333333333f];
	case 52:
		return [PESColorList colorForRed:0.996078431372549f green:0.6196078431372549f blue:0.19607843137254902f];
	case 53:
		return [PESColorList colorForRed:0.6588235294117647f green:0.8705882352941177f blue:0.9215686274509803f];
	case 54:
		return [PESColorList colorForRed:0.0f green:0.403921568627451f blue:0.10196078431372549f];
	case 55:
		return [PESColorList colorForRed:0.3058823529411765f green:0.1607843137254902f blue:0.5647058823529412f];
	case 56:
		return [PESColorList colorForRed:0.1843137254901961f green:0.49411764705882355f blue:0.12549019607843137f];
	case 57:
		return [PESColorList colorForRed:0.9921568627450981f green:0.8509803921568627f blue:0.8705882352941177f];
	case 58:
		return [PESColorList colorForRed:1.0f green:0.8509803921568627f blue:0.06666666666666667f];
	case 59:
		return [PESColorList colorForRed:0.03529411764705882f green:0.3568627450980392f blue:0.6509803921568628f];
	case 60:
		return [PESColorList colorForRed:0.9411764705882353f green:0.9764705882352941f blue:0.4392156862745098f];
	case 61:
		return [PESColorList colorForRed:0.8901960784313725f green:0.9529411764705882f blue:0.3568627450980392f];
	case 62:
		return [PESColorList colorForRed:1.0f green:0.7843137254901961f blue:0.39215686274509803f];
	case 63:
		return [PESColorList colorForRed:1.0f green:0.7843137254901961f blue:0.5882352941176471f];
	case 64:
		return [PESColorList colorForRed:1.0f green:0.7843137254901961f blue:0.7843137254901961f];
	default:
		return nil;
	}
}


#if TARGET_OS_MAC
+ (NSColor *) colorForRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
	return [NSColor colorWithDeviceRed:red green:green blue:blue alpha:1.0f];
}
#endif

#if TARGET_OS_IPHONE
+ (NSColor *) colorForRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
	return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}
#endif


@end
