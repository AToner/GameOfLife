//
//  GoLAppDelegate.h
//  GoL-engine
//
//  Created by Andrew Toner on 3/23/13.
//  Copyright (c) 2013 Andrew Toner. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GoLViewController;

@interface GoLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) GoLViewController *viewController;

@end
