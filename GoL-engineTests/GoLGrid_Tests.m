//
//  GoLGrid.m
//  GoL-engine
//
//  Created by Andrew Toner on 3/23/13.
//  Copyright (c) 2013 Andrew Toner. All rights reserved.
//

#import "GoLGrid.h"
#import "GoLCell.h"
#import "GoLGrid_Tests.h"

@interface GoLGrid_Tests ()

@property (nonatomic) GoLGrid *grid;

@end


@implementation GoLGrid_Tests

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
    CGFloat height = 150;
    CGFloat width = 100;
    CGSize size = CGSizeMake(width, height);
    _grid = [[GoLGrid alloc] initWithSize:size];
    
    STAssertEquals(_grid.size.height, height, @"Heights should be teh same");
    STAssertEquals(_grid.size.width, width, @"Width should be teh same");
    
    NSArray *resultingGrid = [_grid getGrid];
    STAssertNotNil(resultingGrid, @"The resulting grid should not be nil");
    STAssertEquals([[NSNumber numberWithInteger:resultingGrid.count] intValue],
                   [[NSNumber numberWithFloat:height] intValue],
                   @"Resulting grid array count should be height");
    
    GoLCell *cell1 = [_grid getCellFromX:1 Y:1];
    STAssertTrue([cell1 isKindOfClass:[GoLCell class]], @"Actually have a cell");
    STAssertTrue([cell1.generation intValue] == 0, @"The cell has no generation");
    [cell1 create];
    
    GoLCell *cell2 = [_grid getCellFromX:0 Y:1];
    [cell2 create];
 
    STAssertEquals([_grid getNeighbourCountForX:1 Y:1], 1, @"Should be 1 neighbour");
    STAssertEquals([_grid getNeighbourCountForX:0 Y:0], 2, @"Should be 2 neighbours");
    STAssertEquals([_grid getNeighbourCountForX:10 Y:10], 0, @"Should be 0 neighbours");
}

@end
