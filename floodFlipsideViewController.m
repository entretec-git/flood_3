//
//  floodFlipsideViewController.m
//  flood_draft1
//
//  Created by Mick Brown on 25/05/12.




//  Copyright (c) 2012 Entretec Pty Ltd. All rights reserved.

#import "floodFlipsideViewController.h"
#import "RainData.h"


@interface floodFlipsideViewController ()

@end

@implementation floodFlipsideViewController


- (void)awakeFromNib
{
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 480.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
