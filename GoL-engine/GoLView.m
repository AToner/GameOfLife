//
//  GoLView.m
//  GoL-engine
//
//  Created by Andrew Toner on 3/24/13.
//  Copyright (c) 2013 Andrew Toner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoLView.h"
#import "GoLGrid.h"
@implementation GoLView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"Init with coder");
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"Init with Frame");
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    if ([_grid isKindOfClass:[GoLGrid class]]) {
        // Drawing code
        UIBezierPath *surroundPath = [UIBezierPath bezierPathWithRect:rect];
        [[UIColor blackColor] setStroke];
        [[UIColor darkGrayColor] setFill];
        
        // Adjust the drawing options as needed.
        surroundPath.lineWidth = self.contentScaleFactor;
        
        // Fill the path before stroking it so that the fill
        // color does not obscure the stroked line.
        [surroundPath fill];
        [surroundPath stroke];
        //
        // How big is each side
        float horizontalSpacing = self.bounds.size.width / _grid.size.width;
        float verticleSpacing = self.bounds.size.height / _grid.size.height;
        UIBezierPath *gridPath = [UIBezierPath bezierPath];
        gridPath.lineWidth = self.contentScaleFactor;
        for (CGFloat x = horizontalSpacing; x < rect.size.width; x += horizontalSpacing   ) {
            [gridPath moveToPoint:CGPointMake(x, 0)];
            [gridPath addLineToPoint:CGPointMake(x, rect.size.height)];
        }
        
        for (CGFloat y = verticleSpacing; y < rect.size.height; y += verticleSpacing) {
            [gridPath moveToPoint:CGPointMake(0, y)];
            [gridPath addLineToPoint:CGPointMake(rect.size.width, y)];
        }
        
        [gridPath stroke];
        
        // Now fill in the cells that have live
        for (int y = 0; y < _grid.size.height; y++) {
            for (int x = 0; x < _grid.size.width; x++) {
                if ([[_grid getCellFromX:x Y:y] isAlive]) {
                    NSLog(@"Live one at %d, %d", x, y);
                    UIBezierPath *rect = [UIBezierPath bezierPathWithRect:CGRectMake(x * horizontalSpacing,
                                                                                     y * verticleSpacing,
                                                                                     horizontalSpacing,
                                                                                     verticleSpacing)];
                    [[UIColor purpleColor] setFill];
                    [rect fill];
                }
            }
        }

    }
}
@end
