//
//	PESData.m
//	PESHandler
//
//	Created by Raphael Schweikert on 17.04.11.
//	Copyright 2011 Raphael Schweikert. All rights reserved.
//

#import "PESData.h"

#import "PESStitchBlock.h"
#import "PESStitch.h"

@implementation PESData

@synthesize width, height, colorCount;
@synthesize minX, maxX, minY, maxY;
@synthesize stitchBlocks;

- (id)init
{
	self = [super init];
	if (self) {
		stitchBlocks = [[NSMutableArray alloc] init];
	}
	
	return self;
}

- (void)dealloc
{
	[stitchBlocks release];
	[super dealloc];
}

- (NSUInteger) imageWidth {
	return maxX-minX;
}

- (NSUInteger) imageHeight {
	return maxY-minY;
}

- (void) recalculate {
	NSUInteger newMinX = NSUIntegerMax;
	NSUInteger newMaxX = 0;
	NSUInteger newMinY = NSUIntegerMax;
	NSUInteger newMaxY = 0;
	for(PESStitchBlock *block in stitchBlocks) {
		for(PESStitch *stitch in block.stitches) {
			if(stitch.x < newMinX) {
				newMinX = stitch.x;
			}
			if(stitch.x > newMaxX) {
				newMaxX = stitch.x;
			}
			if(stitch.y < newMinY) {
				newMinY = stitch.y;
			}
			if(stitch.y > newMaxY) {
				newMaxY = stitch.y;
			}
		}
	}
	minX = newMinX;
	maxX = newMaxX;
	minY = newMinY;
	maxY = newMaxY;
}

- (void) addStitchBlock:(PESStitchBlock *)block {
	[stitchBlocks addObject:block];
}

@end
