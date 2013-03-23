//
//  GoLGrid.m
//  GoL-engine
//
//  Created by Andrew Toner on 3/23/13.
//  Copyright (c) 2013 Andrew Toner. All rights reserved.
//

#import "GoLGrid_Tests.h"

@interface GoLGrid_Tests ()

@property (nonatomic) GoLGrid *grid;

@end


@implementation GoLGrid_Tests

- (void)setUp
{
    // Set-up code here.

    [super setUp];
    _grid = [GoLGrid alloc];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
    _grid = nil;
}

- (void)testExample
{
    CGSize size = CGSizeMake(100, 150);
    [_grid init:size];
    
    STAssertEquals(_grid.size.height, size.height, @"Heights should be teh same");
    STAssertEquals(_grid.size.width, size.width, @"Width should be teh same");
}

@end
