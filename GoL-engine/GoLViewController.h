//
//  GoLViewController.h
//  GoL-engine
//
//  Created by Andrew Toner on 3/23/13.
//  Copyright (c) 2013 Andrew Toner. All rights reserved.
//

#import "GoLView.h"
#import <UIKit/UIKit.h>

@interface GoLViewController : UIViewController

@property (strong, nonatomic) IBOutlet GoLView *gridView;
@property (strong, nonatomic) IBOutlet UIButton *startStopButton;
- (IBAction)startStop:(UIButton *)sender;

@end
