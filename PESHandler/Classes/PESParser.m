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
	for(NSUInteger i = 0;i<colorCount;i++) {
		NSLog(@"Found color %u", colors[i]);
	}
	
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
			if(value1 >= 128) {
				//Jump stitch
				deltaX = (value1 & 15);
				if (deltaX <= 7) {
					deltaX = value2 + (deltaX * 256);
				} else {
					deltaX = (value2 - 256) + ((deltaX - 15) * 256);
				}
				[self bytesInto:&value2 count:1];
			} else {
				deltaX = value1;
				if(deltaX > 63) {
					deltaX -= 128;
				}
			}
			NSInteger deltaY = 0;
			if(value2 >= 128) {
				//Jump stitch
				deltaY = (value2 & 15);
				[self bytesInto:&value3 count:1];
				if (deltaY <= 7) {
					deltaY = value3 + (deltaY * 256);
				} else {
					deltaY = (value3 - 256) + ((deltaY - 15) * 256);
				}
			} else {
				deltaY = value2;
				if(deltaY > 63) {
					deltaY -= 128;
				}
			}
			if(previousStitch != nil) {
				currentStitch.x = previousStitch.x + deltaX;
				currentStitch.y = previousStitch.x + deltaY;
			} else {
				currentStitch.x = deltaX;
				currentStitch.y = deltaY;
			}
		}
		[previousStitch release];
		previousStitch = currentStitch;
	}
	[previousStitch release];
	
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
