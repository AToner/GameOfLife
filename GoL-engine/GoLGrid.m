//
//  GoLGrid.m
//  GoL-engine
//
//  Created by Andrew Toner on 3/23/13.
//  Copyright (c) 2013 Andrew Toner. All rights reserved.
//

#import "GoLGrid.h"

@interface GoLGrid ()

@property (strong, nonatomic) NSMutableArray *theGrid;

@end

@implementation GoLGrid

- (id)initWithSize:(CGSize)size
{
    self = [super init];
    if (self)  {
        _size = size;
        
        // Create the grid
        _theGrid = [NSMutableArray array];
        for (int y = 0; y < _size.height; y++) {
            NSMutableArray *subArr = [NSMutableArray array];
            for (int x = 0; x < _size.width; x++) {
                [subArr addObject:[[GoLCell alloc] init]];
            }
            [_theGrid addObject:subArr];
        }
        //
        // Go through the grid telling each cell about it's neighbours
        // Should speed up life in the future
        for (int y = 0; y < _size.height; y++) {
            for (int x = 0; x < _size.width; x++) {
                GoLCell *cell = [self getCellFromX:x Y:y];
                NSMutableArray *neighbours = [NSMutableArray array];
                int minX = (x == 0) ? 0 : x - 1;
                int minY = (y == 0) ? 0 : y - 1;
                int maxX = (x == self.size.width - 1) ? x : x + 1;
                int maxY = (y == self.size.height - 1) ? y : y + 1;
                for (int i = minY; i <= maxY; i++) {
                    for (int j = minX; j <= maxX; j++) {
                        GoLCell *neighbourCell = [self getCellFromX:j Y:i];
                        if (neighbourCell != cell) [neighbours addObject:neighbourCell];
                    }
                }
                [cell setNeighbours:[NSSet setWithArray:neighbours]];
            }
        }
    }
    return self;
}

- (GoLCell *)getCellFromX:(int)x Y:(int)y
{
    return _theGrid[y][x];
}

- (NSArray *)getGrid
{
    return self.theGrid;
}

- (int)getNeighbourCountForX:(int)x Y:(int)y
{
    GoLCell *cell = [self getCellFromX:x Y:y];
    int count = 0;
    for (GoLCell *ncell in cell.neighbours) {
        if (ncell.isAlive) count++;
    }
    return count;
}

@end
