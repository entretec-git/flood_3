//
//  floodFlipsideViewController.h
//  flood_draft1
//
//  Created by Mick Brown on 25/05/12.
//  Copyright (c) 2012 Entretec Pty Ltd. All rights reserved.


#import <UIKit/UIKit.h>

@class floodFlipsideViewController;

@protocol floodFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(floodFlipsideViewController *)controller;
@end

@interface floodFlipsideViewController : UIViewController

@property (weak, nonatomic) id <floodFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
