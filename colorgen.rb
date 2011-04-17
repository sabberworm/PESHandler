require 'csv'

file = ARGV[0]

table = CSV.read(file, headers: true)


puts <<FILE
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
FILE

table.each do |row|
	puts "	case #{row['Num']}:"
	puts "		return [PESColorList colorForRed:#{row['R'].to_f/255.0}f green:#{row['G'].to_f/255.0}f blue:#{row['B'].to_f/255.0}f];"
end

puts <<FILE
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
FILE