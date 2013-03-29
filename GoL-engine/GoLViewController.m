//
//  GoLViewController.m
//  GoL-engine
//
//  Created by Andrew Toner on 3/23/13.
//  Copyright (c) 2013 Andrew Toner. All rights reserved.
//

#import "GoLViewController.h"

@interface GoLViewController ()

@property (strong, nonatomic) NSTimer *timer;

@end

static const CGFloat height = 50;
static const CGFloat width = 50;

@implementation GoLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Set-up code here.
    CGSize size = CGSizeMake(width, height);
    GoLGrid *grid = [[GoLGrid alloc] initWithSize:size];
    [self.gridView setGrid:grid];
    
    [self.startStopButton setTitle:@"Start" forState:UIControlStateNormal];
    self.timer = nil;
}

- (void)nextGeneration
{
    [self.gridView.grid nextGeneration];
    [self.gridView setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startStop:(UIButton *)sender {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
        [self.startStopButton setTitle:@"Start" forState:UIControlStateNormal];
    } else {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                      target:self
                                                    selector:@selector(nextGeneration)
                                                    userInfo:nil
                                                     repeats:YES];
        [self.startStopButton setTitle:@"Stop" forState:UIControlStateNormal];
    }
}
@end
