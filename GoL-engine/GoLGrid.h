//
//  GoLGrid.h
//  GoL-engine
//
//  Created by Andrew Toner on 3/23/13.
//  Copyright (c) 2013 Andrew Toner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoLGrid : NSObject

@property (readonly, nonatomic) CGSize size;

- (id)initWithSize:(CGSize)size;

- (NSArray *)getGrid;


@end
