//
//  PESParser.m
//  PESHandler
//
//  Created by Raphael Schweikert on 17.04.11.
//  Copyright 2011 Raphael Schweikert. All rights reserved.
//

#import "PESParser.h"

#import "PESData.h"
#import "PESStitchBlock.h"
#import "PESStitch.h"

@interface PESParser () {
}
- (void)bytesInto:(void *)into count:(NSUInteger)amount;
@end

@implementation PESParser

- (id)initWithData:(NSData *)data
{
	self = [super init];
	if (self) {
		parseData = [data retain];
		currentPosition = 0x0;
	}
	return self;
}

- (id)initWithFile:(NSString *)path
{
	return [self initWithData:[NSData dataWithContentsOfFile:path]];
}

- (PESData *)parse {
	PESData *result = [[PESData alloc] init];
	
	currentPosition = 0x0;
	
	char start[4+1] = "    ";
	[self bytesInto:start count:4];
	
	if(strcmp(start, "#PES") != 0) {
		[result release];
		return nil;
	}
	currentPosition += 4;
	
	uint32_t pecStart = 0;
	[self bytesInto:&pecStart count:4];
	
	currentPosition = pecStart+48;
	
	uint8_t colorCount = 0;
	[self bytesInto:&colorCount count:1];
	colorCount++;
	result.colorCount = colorCount;
	
	uint8_t colors[colorCount];
	[self bytesInto:colors count:colorCount];
	
	currentPosition = pecStart+521;
	
	uint16_t width;
	uint16_t height;
	[self bytesInto:&width count:2];
	[self bytesInto:&height count:2];
	result.width = width;
	result.height = height;
	
	currentPosition = pecStart+532;
	
	PESStitchBlock *currentBlock = nil;
	PESStitch *previousStitch = nil;
	NSUInteger colorIndex = 0;
	
	currentBlock = [[PESStitchBlock alloc] init];
	[result addStitchBlock:currentBlock];
	currentBlock.color = colors[0];
	
	while ([parseData length] > currentPosition) {
		PESStitch *currentStitch = nil;
		
		uint8_t value1;
		uint8_t value2;
		uint8_t value3;
		
		[self bytesInto:&value1 count:1];
		[self bytesInto:&value2 count:1];
		
		if(value1 == 255 && value2 == 0) {
			//end of file
			break;
		}
		if(value1 == 254 && value2 == 176) {
			//Color change
			[self bytesInto:&value3 count:1];
			[currentBlock release];
			colorIndex++;
			currentBlock = [[PESStitchBlock alloc] init];
			[result addStitchBlock:currentBlock];
			currentBlock.color = colors[colorIndex];
		} else {
			NSInteger deltaX = 0;
			currentStitch = [[PESStitch alloc] init];
			[currentBlock addStitch:currentStitch];
			BOOL isJumpStitch = NO;
			if((value1 & 128) == 128) {
				//Jump stitch
				deltaX = ((value1 & 15) * 256) + value2;
				if ((deltaX & 0x800) == 0x800) {
					deltaX -= 0x1000;
				}
				[self bytesInto:&value2 count:1];
				isJumpStitch = YES;
			} else {
				deltaX = value1;
				if(deltaX > 63) {
					deltaX -= 128;
				}
			}
			NSInteger deltaY = 0;
			if((value2 & 128) == 128) {
				//Jump stitch
				[self bytesInto:&value3 count:1];
				deltaY = ((value2 & 15) * 256) + value3;
				if ((deltaY & 0x800) == 0x800) {
					deltaY -= 0x1000;
				}
				isJumpStitch = YES;
			} else {
				deltaY = value2;
				if(deltaY > 63) {
					deltaY -= 128;
				}
			}
			if(previousStitch != nil) {
				currentStitch.x = previousStitch.x + deltaX;
				currentStitch.y = previousStitch.y + deltaY;
			} else {
				currentStitch.x = deltaX;
				currentStitch.y = deltaY;
			}
			currentStitch.isJumpStitch = isJumpStitch;
			[previousStitch release];
			previousStitch = currentStitch;
		}
	}
	[previousStitch release];
	[currentBlock release];
	
	[result recalculate];
	
	return [result autorelease];
}

- (void)bytesInto:(void *)into count:(NSUInteger)amount {
	[parseData getBytes:into range:NSMakeRange(currentPosition, amount)];
	currentPosition += amount;
}

- (void)dealloc
{
	[parseData release];
	[super dealloc];
}

@end
