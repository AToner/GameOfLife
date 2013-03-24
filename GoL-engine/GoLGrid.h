//
//  GoLGrid.h
//  GoL-engine
//
//  Created by Andrew Toner on 3/23/13.
//  Copyright (c) 2013 Andrew Toner. All rights reserved.
//

#import "GoLCell.h"
#import <Foundation/Foundation.h>

@interface GoLGrid : NSObject

@property (readonly, nonatomic) CGSize size;

- (id)initWithSize:(CGSize)size;

- (NSArray *)getGrid;
- (GoLCell *)getCellFromX:(int)x Y:(int)y;
- (int)getNeighbourCountForX:(int)x Y:(int)y;
- (GoLGrid *)nextGeneration;

@end
