//
//  returnPeriodViewControllerViewController.m
//  flood_draft_2
//
//  Created by Mick Brown on 29/05/12.
//  Copyright (c) 2012 Entretec Pty Ltd. All rights reserved.


#import "returnPeriodViewControllerViewController.h"

@interface returnPeriodViewController ()

@end

@implementation returnPeriodViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    rainEvents = [[NSArray alloc] initWithObjects:@"2",@"5",@"10",@"20",@"50",@"100",@"500",@"700",nil] ;
                  
    self.contentSizeForViewInPopover = CGSizeMake(220.0, 240.0);
    myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 220, 200)];
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    [self.view addSubview:myPickerView];
    
    
    _doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _doneButton.backgroundColor = [UIColor clearColor];
    
    [_doneButton addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    _doneButton.frame = CGRectMake(0.0,202.0,  202.0, 30.0);
    [_doneButton setTitle: @"Done" forState:UIControlStateNormal] ;
    
    [self.view addSubview:_doneButton];
    
    
    
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

-(IBAction)aMethod:(id)sender
{ 
    NSLog(@"In showReturnPeriodResults popover  %i",_resultRow);
    
    [_delegateEvent showReturnPeriodResults:_resultRow:_yearsReturn];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
        // Handle the selection
    
    _resultRow= row;
    _yearsReturn = rainEvents[row];
    
}

    // tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSUInteger numRows = [rainEvents count];
    
    return numRows;
}

    // tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

    // tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    NSString *title;
//    title = [@"" stringByAppendingFormat:@"%d",row];
    
    return rainEvents[row];
}

    // tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    int sectionWidth = 100;
    
    return sectionWidth;
}
@end
