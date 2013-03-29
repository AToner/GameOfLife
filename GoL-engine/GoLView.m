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

float horizontalSpacing = 0;
float verticleSpacing = 0;
CGPoint lastTouchedPoint;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"Init with coder");
        lastTouchedPoint = CGPointMake(-1, -1);
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
    if ([self.grid isKindOfClass:[GoLGrid class]]) {
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
        horizontalSpacing = self.bounds.size.width / self.grid.size.width;
        verticleSpacing = self.bounds.size.height / self.grid.size.height;
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
        for (int y = 0; y < self.grid.size.height; y++) {
            for (int x = 0; x < self.grid.size.width; x++) {
                if ([[self.grid getCellFromX:x Y:y] isAlive]) {
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self handleTouch:touches];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self handleTouch:touches];
    lastTouchedPoint = CGPointMake(-1, -1);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self handleTouch:touches];
}

- (void)handleTouch:(NSSet *)touches
{
    UITouch *touch = [[touches allObjects] objectAtIndex: 0];
    CGPoint gridViewLocation = [touch locationInView:self];
    //
    // How big is each side
    CGPoint gridReference = CGPointMake(floor(gridViewLocation.x / horizontalSpacing),
                                        floor(gridViewLocation.y / verticleSpacing));
    if (!CGPointEqualToPoint(lastTouchedPoint, gridReference)) {
        GoLCell *cell = [self.grid getCellFromX:gridReference.x Y:gridReference.y];
        if (cell.isAlive) {
            [cell die];
        } else {
            [cell create];
        }
        lastTouchedPoint = gridReference;
    }
    [self performSelectorOnMainThread:@selector(setNeedsDisplay) withObject:self waitUntilDone:NO];
}

@end
