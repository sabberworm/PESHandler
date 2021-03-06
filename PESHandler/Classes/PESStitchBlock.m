//
//	PESStitchBlock.m
//	PESHandler
//
//	Created by Raphael Schweikert on 17.04.11.
//	Copyright 2011 Raphael Schweikert. All rights reserved.
//

#import "PESStitchBlock.h"

#import "PESStitch.h"

@implementation PESStitchBlock

@synthesize color;
@synthesize stitches;

- (id)init
{
	self = [super init];
	if (self) {
		stitches = [[NSMutableArray alloc] init];
	}
	
	return self;
}

- (void)dealloc
{
	[stitches release];
	[super dealloc];
}

- (void) addStitch:(PESStitch *) stitch {
	[stitches addObject:stitch];
}

- (NSBezierPath *) pathFromBlockWithScale:(CGFloat)scale {
	return [self pathFromBlockXOffset:0 yOffset:0 andScale:scale];
}

- (NSBezierPath *) pathFromBlockXOffset:(NSUInteger)xOffset yOffset:(NSInteger) yOffset andScale:(CGFloat)scale {
	return [self pathFromBlockXOffset:xOffset yOffset:yOffset scale:scale ignoringJumps:NO];
}

- (NSBezierPath *) pathFromBlockXOffset:(NSUInteger)xOffset yOffset:(NSInteger) yOffset scale:(CGFloat)scale ignoringJumps:(BOOL)ignoringJumps {
	NSBezierPath *result = [[NSBezierPath alloc] init];
	
	BOOL first = YES;
	for(PESStitch *stitch in stitches) {
		CGFloat x = stitch.x + xOffset;
		CGFloat y = stitch.y + yOffset;
		x *= scale;
		y *= scale;
		if(first || (!ignoringJumps && stitch.isJumpStitch)) {
			[result moveToPoint:(NSPoint){x, y}];
			first = NO;
		} else {
			[result lineToPoint:(NSPoint){x, y}];
		}
	}
	
	return [result autorelease];
}

@end
