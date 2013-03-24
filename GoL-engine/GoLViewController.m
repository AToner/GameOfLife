//
//  GoLViewController.m
//  GoL-engine
//
//  Created by Andrew Toner on 3/23/13.
//  Copyright (c) 2013 Andrew Toner. All rights reserved.
//

#import "GoLViewController.h"

@interface GoLViewController ()

@end

static const CGFloat height = 20;
static const CGFloat width = 20;

@implementation GoLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Set-up code here.
    CGSize size = CGSizeMake(width, height);
    GoLGrid *grid = [[GoLGrid alloc] initWithSize:size];
    
    GoLCell *cell1 = [grid getCellFromX:1 Y:0];
    GoLCell *cell2 = [grid getCellFromX:1 Y:1];
    GoLCell *cell3 = [grid getCellFromX:1 Y:2];
    [cell1 live];
    [cell2 live];
    [cell3 live];
    [_gridView setGrid:grid];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(nextGeneration)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)nextGeneration
{
    [_gridView.grid nextGeneration];
    [_gridView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
