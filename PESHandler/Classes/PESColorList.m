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

+ (void) getColorComponentsForColorNumber:(NSUInteger)num red:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue;

@end

@implementation PESColorList

+ (CGColorRef) CGColorWithColorNumber:(NSUInteger)num {
	CGFloat red;
	CGFloat green;
	CGFloat blue;
	[PESColorList getColorComponentsForColorNumber:num red:&red green:&green blue:&blue];
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef color = CGColorCreate(colorSpace, (CGFloat[]){red, green, blue, 1.0f});
	CFRelease(colorSpace);
	return color;
}

#if TARGET_OS_MAC
+ (NSColor *) colorWithColorNumber:(NSUInteger)num {
	CGFloat red;
	CGFloat green;
	CGFloat blue;
	[PESColorList getColorComponentsForColorNumber:num red:&red green:&green blue:&blue];
	return [NSColor colorWithDeviceRed:red green:green blue:blue alpha:1.0f];
}

#elif TARGET_OS_IPHONE
+ (UIColor *) colorWithColorNumber:(NSUInteger)num {
	CGFloat red;
	CGFloat green;
	CGFloat blue;
	[PESColorList getColorComponentsForColorNumber:num red:&red green:&green blue:&blue];
	return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}
#endif

+ (void) getColorComponentsForColorNumber:(NSUInteger)num red:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue {
	switch (num) {
	case 1:
		*red = 0.054901960784313725f; *green = 0.12156862745098039f; *blue = 0.48627450980392156f;
		break;
	case 2:
		*red = 0.0392156862745098f; *green = 0.3333333333333333f; *blue = 0.6392156862745098f;
		break;
	case 3:
		*red = 0.18823529411764706f; *green = 0.5294117647058824f; *blue = 0.4666666666666667f;
		break;
	case 4:
		*red = 0.29411764705882354f; *green = 0.4196078431372549f; *blue = 0.6862745098039216f;
		break;
	case 5:
		*red = 0.9294117647058824f; *green = 0.09019607843137255f; *blue = 0.12156862745098039f;
		break;
	case 6:
		*red = 0.8196078431372549f; *green = 0.3607843137254902f; *blue = 0.0f;
		break;
	case 7:
		*red = 0.5686274509803921f; *green = 0.21176470588235294f; *blue = 0.592156862745098f;
		break;
	case 8:
		*red = 0.8941176470588236f; *green = 0.6039215686274509f; *blue = 0.796078431372549f;
		break;
	case 9:
		*red = 0.5686274509803921f; *green = 0.37254901960784315f; *blue = 0.6745098039215687f;
		break;
	case 10:
		*red = 0.615686274509804f; *green = 0.8392156862745098f; *blue = 0.49019607843137253f;
		break;
	case 11:
		*red = 0.9098039215686274f; *green = 0.6627450980392157f; *blue = 0.0f;
		break;
	case 12:
		*red = 0.996078431372549f; *green = 0.7294117647058823f; *blue = 0.20784313725490197f;
		break;
	case 13:
		*red = 1.0f; *green = 1.0f; *blue = 0.0f;
		break;
	case 14:
		*red = 0.4392156862745098f; *green = 0.7372549019607844f; *blue = 0.12156862745098039f;
		break;
	case 15:
		*red = 0.7529411764705882f; *green = 0.5803921568627451f; *blue = 0.0f;
		break;
	case 16:
		*red = 0.6588235294117647f; *green = 0.6588235294117647f; *blue = 0.6588235294117647f;
		break;
	case 17:
		*red = 0.4823529411764706f; *green = 0.43529411764705883f; *blue = 0.0f;
		break;
	case 18:
		*red = 1.0f; *green = 1.0f; *blue = 0.7019607843137254f;
		break;
	case 19:
		*red = 0.30980392156862746f; *green = 0.3333333333333333f; *blue = 0.33725490196078434f;
		break;
	case 20:
		*red = 0.0f; *green = 0.0f; *blue = 0.0f;
		break;
	case 21:
		*red = 0.043137254901960784f; *green = 0.23921568627450981f; *blue = 0.5686274509803921f;
		break;
	case 22:
		*red = 0.4666666666666667f; *green = 0.00392156862745098f; *blue = 0.4627450980392157f;
		break;
	case 23:
		*red = 0.1607843137254902f; *green = 0.19215686274509805f; *blue = 0.2f;
		break;
	case 24:
		*red = 0.16470588235294117f; *green = 0.07450980392156863f; *blue = 0.00392156862745098f;
		break;
	case 25:
		*red = 0.9647058823529412f; *green = 0.2901960784313726f; *blue = 0.5411764705882353f;
		break;
	case 26:
		*red = 0.6980392156862745f; *green = 0.4627450980392157f; *blue = 0.1411764705882353f;
		break;
	case 27:
		*red = 0.9882352941176471f; *green = 0.7333333333333333f; *blue = 0.7686274509803922f;
		break;
	case 28:
		*red = 0.996078431372549f; *green = 0.21568627450980393f; *blue = 0.058823529411764705f;
		break;
	case 29:
		*red = 0.9411764705882353f; *green = 0.9411764705882353f; *blue = 0.9411764705882353f;
		break;
	case 30:
		*red = 0.41568627450980394f; *green = 0.10980392156862745f; *blue = 0.5411764705882353f;
		break;
	case 31:
		*red = 0.6588235294117647f; *green = 0.8666666666666667f; *blue = 0.7686274509803922f;
		break;
	case 32:
		*red = 0.1450980392156863f; *green = 0.5176470588235295f; *blue = 0.7333333333333333f;
		break;
	case 33:
		*red = 0.996078431372549f; *green = 0.7019607843137254f; *blue = 0.2627450980392157f;
		break;
	case 34:
		*red = 1.0f; *green = 0.9411764705882353f; *blue = 0.5529411764705883f;
		break;
	case 35:
		*red = 0.8156862745098039f; *green = 0.6509803921568628f; *blue = 0.3764705882352941f;
		break;
	case 36:
		*red = 0.8196078431372549f; *green = 0.32941176470588235f; *blue = 0.0f;
		break;
	case 37:
		*red = 0.4f; *green = 0.7294117647058823f; *blue = 0.28627450980392155f;
		break;
	case 38:
		*red = 0.07450980392156863f; *green = 0.2901960784313726f; *blue = 0.27450980392156865f;
		break;
	case 39:
		*red = 0.5294117647058824f; *green = 0.5294117647058824f; *blue = 0.5294117647058824f;
		break;
	case 40:
		*red = 0.8470588235294118f; *green = 0.792156862745098f; *blue = 0.7764705882352941f;
		break;
	case 41:
		*red = 0.2627450980392157f; *green = 0.33725490196078434f; *blue = 0.027450980392156862f;
		break;
	case 42:
		*red = 0.996078431372549f; *green = 0.8901960784313725f; *blue = 0.7725490196078432f;
		break;
	case 43:
		*red = 0.9764705882352941f; *green = 0.5764705882352941f; *blue = 0.7372549019607844f;
		break;
	case 44:
		*red = 0.0f; *green = 0.2196078431372549f; *blue = 0.13333333333333333f;
		break;
	case 45:
		*red = 0.6980392156862745f; *green = 0.6862745098039216f; *blue = 0.8313725490196079f;
		break;
	case 46:
		*red = 0.40784313725490196f; *green = 0.41568627450980394f; *blue = 0.6901960784313725f;
		break;
	case 47:
		*red = 0.9372549019607843f; *green = 0.8901960784313725f; *blue = 0.7254901960784313f;
		break;
	case 48:
		*red = 0.9686274509803922f; *green = 0.2196078431372549f; *blue = 0.4f;
		break;
	case 49:
		*red = 0.7098039215686275f; *green = 0.2980392156862745f; *blue = 0.39215686274509803f;
		break;
	case 50:
		*red = 0.07450980392156863f; *green = 0.16862745098039217f; *blue = 0.10196078431372549f;
		break;
	case 51:
		*red = 0.7803921568627451f; *green = 0.00392156862745098f; *blue = 0.3333333333333333f;
		break;
	case 52:
		*red = 0.996078431372549f; *green = 0.6196078431372549f; *blue = 0.19607843137254902f;
		break;
	case 53:
		*red = 0.6588235294117647f; *green = 0.8705882352941177f; *blue = 0.9215686274509803f;
		break;
	case 54:
		*red = 0.0f; *green = 0.403921568627451f; *blue = 0.10196078431372549f;
		break;
	case 55:
		*red = 0.3058823529411765f; *green = 0.1607843137254902f; *blue = 0.5647058823529412f;
		break;
	case 56:
		*red = 0.1843137254901961f; *green = 0.49411764705882355f; *blue = 0.12549019607843137f;
		break;
	case 57:
		*red = 0.9921568627450981f; *green = 0.8509803921568627f; *blue = 0.8705882352941177f;
		break;
	case 58:
		*red = 1.0f; *green = 0.8509803921568627f; *blue = 0.06666666666666667f;
		break;
	case 59:
		*red = 0.03529411764705882f; *green = 0.3568627450980392f; *blue = 0.6509803921568628f;
		break;
	case 60:
		*red = 0.9411764705882353f; *green = 0.9764705882352941f; *blue = 0.4392156862745098f;
		break;
	case 61:
		*red = 0.8901960784313725f; *green = 0.9529411764705882f; *blue = 0.3568627450980392f;
		break;
	case 62:
		*red = 1.0f; *green = 0.7843137254901961f; *blue = 0.39215686274509803f;
		break;
	case 63:
		*red = 1.0f; *green = 0.7843137254901961f; *blue = 0.5882352941176471f;
		break;
	case 64:
		*red = 1.0f; *green = 0.7843137254901961f; *blue = 0.7843137254901961f;
		break;
	}
}

@end
