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

static const CGFloat height = 20;
static const CGFloat width = 20;

- (void)setUp
{
    // Set-up code here.
    CGSize size = CGSizeMake(width, height);
    _grid = [[GoLGrid alloc] initWithSize:size];

    [super setUp];
}

- (void)tearDown
{
    // Tear-down code here.
    _grid = nil;
    [super tearDown];
}

- (void)testBasics
{
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

- (void)testGeneration
{
    /*
     010
     010
     010
     
     000
     111
     000
     */
    GoLCell *cell1 = [_grid getCellFromX:1 Y:0];
    GoLCell *cell2 = [_grid getCellFromX:1 Y:1];
    GoLCell *cell3 = [_grid getCellFromX:1 Y:2];
    [cell1 live];
    [cell2 live];
    [cell3 live];
    _grid = [_grid nextGeneration];

    cell1 = [_grid getCellFromX:0 Y:1];
    cell2 = [_grid getCellFromX:1 Y:1];
    cell3 = [_grid getCellFromX:2 Y:1];
    STAssertTrue(cell1.isAlive, @"0,1 is alive");
    STAssertTrue(cell2.isAlive, @"1,1 is alive");
    STAssertTrue(cell3.isAlive, @"2,1 is alive");

    cell1 = [_grid getCellFromX:0 Y:0];
    cell2 = [_grid getCellFromX:1 Y:0];
    cell3 = [_grid getCellFromX:2 Y:0];
    STAssertFalse(cell1.isAlive, @"0,0 is dead");
    STAssertFalse(cell2.isAlive, @"1,0 is dead");
    STAssertFalse(cell3.isAlive, @"2,0 is dead");

    cell1 = [_grid getCellFromX:0 Y:2];
    cell2 = [_grid getCellFromX:1 Y:2];
    cell3 = [_grid getCellFromX:2 Y:2];
    STAssertFalse(cell1.isAlive, @"0,2 is dead");
    STAssertFalse(cell2.isAlive, @"1,2 is dead");
    STAssertFalse(cell3.isAlive, @"2,2 is dead");

}

- (void)testGeneration2
{
    /*
     010
     111
     010
     
     010
     101
     010
     */
    GoLCell *cell1 = [_grid getCellFromX:1 Y:0];
    GoLCell *cell2 = [_grid getCellFromX:1 Y:1];
    GoLCell *cell3 = [_grid getCellFromX:1 Y:2];
    GoLCell *cell4 = [_grid getCellFromX:0 Y:1];
    GoLCell *cell5 = [_grid getCellFromX:2 Y:1];
    [cell1 live];
    [cell2 live];
    [cell3 live];
    [cell4 live];
    [cell5 live];
    _grid = [_grid nextGeneration];
    
    cell1 = [_grid getCellFromX:1 Y:0];
    cell2 = [_grid getCellFromX:0 Y:1];
    cell3 = [_grid getCellFromX:2 Y:1];
    cell4 = [_grid getCellFromX:1 Y:2];
    STAssertTrue(cell1.isAlive, @"1,0 is alive");
    STAssertTrue(cell2.isAlive, @"0,1 is alive");
    STAssertTrue(cell3.isAlive, @"2,1 is alive");
    STAssertTrue(cell4.isAlive, @"1,2 is alive");
    
    cell1 = [_grid getCellFromX:1 Y:1];
    STAssertFalse(cell1.isAlive, @"1,1 is dead");
    
//    cell1 = [_grid getCellFromX:0 Y:2];
//    cell2 = [_grid getCellFromX:1 Y:2];
//    cell3 = [_grid getCellFromX:2 Y:2];
//    STAssertFalse(cell1.isAlive, @"0,2 is dead");
//    STAssertFalse(cell2.isAlive, @"1,2 is dead");
//    STAssertFalse(cell3.isAlive, @"2,2 is dead");
    
}

@end
