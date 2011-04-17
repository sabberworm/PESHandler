//
//	PESHandlerTests.m
//	PESHandlerTests
//
//	Created by Raphael Schweikert on 17.04.11.
//	Copyright 2011 Raphael Schweikert. All rights reserved.
//

#define SIZE_CM_FACTOR 22937.6

#define ASSERT_CM_SIZE(size, desired, message) \
STAssertTrue(ABS(size/SIZE_CM_FACTOR - desired) < 0.001, message);\

#import "PESHandlerTests.h"

#import "PESParser.h"
#import "PESData.h"

@implementation PESHandlerTests

- (void)setUp
{
	[super setUp];
	
	// Set-up code here.
}

- (void)tearDown
{
	// Tear-down code here.
	
	[super tearDown];
}


- (void)testColorCount {
	PESParser *parser = [[PESParser alloc] initWithFile:@"/Users/rafi/Pictures/Design/Embroidery/From Brother/Design_Boutique2/alphabet/ALP05.pes"];
	PESData *data = [parser parse];
	[parser release];
	STAssertTrue(data.colorCount == 2, @"Two colors for alphabet");
	
	parser = [[PESParser alloc] initWithFile:@"/Users/rafi/Pictures/Design/Embroidery/From Brother/Design_Boutique2/animals/AML01.pes"];
	data = [parser parse];
	[parser release];
	STAssertTrue(data.colorCount == 7, @"Seven colors for animal");
	
	parser = [[PESParser alloc] initWithFile:@"/Users/rafi/Pictures/Design/Embroidery/From Brother/Design_Boutique2/childrens/CLD01.pes"];
	data = [parser parse];
	[parser release];
	STAssertTrue(data.colorCount == 4, @"Four colors for children");
}

@end
