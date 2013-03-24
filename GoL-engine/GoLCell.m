//
//  GoLCell.m
//  GoL-engine
//
//  Created by Andrew Toner on 3/23/13.
//  Copyright (c) 2013 Andrew Toner. All rights reserved.
//

#import "GoLCell.h"

@interface GoLCell ()

@end

@implementation GoLCell

- (id)init
{
    self = [super init];
    if (self) {
        _generation = 0;
        _neighbours = [NSMutableArray array];
    }
    return self;
}

- (void)die
{
    _generation = 0;
}

- (void)create
{
    if (!self.isAlive) {
        _generation = [NSNumber numberWithInt:1];
    }
}

- (void)live
{
    if (self.isAlive) {
        _generation = [NSNumber numberWithInt:([self.generation intValue] + 1)];
    } else {
        [self create];
    }
}

- (BOOL)isAlive
{
    return (self.generation > 0);
}

@end
