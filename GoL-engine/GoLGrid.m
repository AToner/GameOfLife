//
//  GoLGrid.m
//  GoL-engine
//
//  Created by Andrew Toner on 3/23/13.
//  Copyright (c) 2013 Andrew Toner. All rights reserved.
//

#import "GoLCell.h"
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
        
        _theGrid = [NSMutableArray array];
        for (int k = 0; k < _size.height; k++) {
            NSMutableArray *subArr = [NSMutableArray array];
            for (int s = 0; s < _size.width; s++) {
                [subArr addObject:[[GoLCell alloc] init]];
            }
            [_theGrid addObject:subArr];
        }
    }
    return self;
}

- (NSArray *)getGrid
{
    return self.theGrid;
}
@end
