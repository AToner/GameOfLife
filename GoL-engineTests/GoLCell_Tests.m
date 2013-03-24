//
//  GoLCell_Tests.m
//  GoL-engine
//
//  Created by Andrew Toner on 3/23/13.
//  Copyright (c) 2013 Andrew Toner. All rights reserved.
//

#import "GoLCell.h"
#import "GoLCell_Tests.h"

@implementation GoLCell_Tests

- (void)setUp
{
    // Set-up code here.
    
    [super setUp];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    GoLCell *cell = [[GoLCell alloc] init];
    STAssertEquals([cell.generation intValue], [[NSNumber numberWithInteger:0] intValue], @"Generation should be 0");
    
    STAssertFalse(cell.isAlive, @"Cell should be dead");
    
    [cell create];
    STAssertTrue(cell.isAlive, @"Cell should be alive");
    
    [cell die];
    STAssertFalse(cell.isAlive, @"Cell should be dead again");
}
@end
