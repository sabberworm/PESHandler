//
//	PESStitchBlock.m
//	PESHandler
//
//	Created by Raphael Schweikert on 17.04.11.
//	Copyright 2011 Raphael Schweikert. All rights reserved.
//

#import "PESStitchBlock.h"

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

@end
