//
//  SlopeViewController.m
//  flood_draft_2
//
//  Created by Mick Brown on 26/05/12.
//  Copyright (c) 2012 Entretec Pty Ltd. All rights reserved.


#import "SlopeViewController.h"

@interface slopeViewController ()
{
     
}
@end

@implementation slopeViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)aMethod:(id)sender
{ 
       NSLog(@"In popover  %i",_result);

   [_delegateSlope showSlopeResults:_result];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   
        // NSArray *period  = [@"2",@"5",@"10",@"20",@"50",@"100",@"500"];
    
    
    self.contentSizeForViewInPopover = CGSizeMake(420.0, 400.0);
    myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 220, 200)];
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    [self.view addSubview:myPickerView];

    
    _doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _doneButton.backgroundColor = [UIColor clearColor];

    [_doneButton addTarget:self action:@selector(aMethod:) forControlEvents:UIControlEventTouchUpInside];
    _doneButton.frame = CGRectMake(0.0,342.0,  52.0, 30.0);
    [_doneButton setTitle: @"Done" forState:UIControlStateNormal] ;
    
    [self.view addSubview:_doneButton];
    
    
}




//-(void) viewWillAppear:(BOOL)animated
//{
//      
//    animated=YES;
//    
//}
//- (void)viewDidUnload
//{
//    [super viewDidUnload];
//    // Release any retained subviews of the main view.
//}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (id)initWithContentViewController:(UIViewController *)viewController
{
    return self;
    
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
        // Handle the selection
 
    _result= row;
        
    
}

    // tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSUInteger numRows = 100;
    
    return numRows;
}

    // tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

    // tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title;
    title = [@"" stringByAppendingFormat:@"%d",row];
    
    return title;
}

    // tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    int sectionWidth = 100;
    
    return sectionWidth;
}
@end
