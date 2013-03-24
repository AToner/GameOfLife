//
//  GoLCell.h
//  GoL-engine
//
//  Created by Andrew Toner on 3/23/13.
//  Copyright (c) 2013 Andrew Toner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoLCell : NSObject

@property (strong, readonly) NSNumber *generation;
@property (strong, nonatomic) NSSet *neighbours;

- (void)die;
- (void)create;
- (BOOL)isAlive;
- (void)live;

@end
