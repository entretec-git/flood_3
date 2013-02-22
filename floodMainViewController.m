//
//  floodMainViewController.m



#import "floodMainViewController.h"
#import "ModelCode.h"
#import "RainData.h"

@interface floodMainViewController ()



@end

#define INTOBJ(v) [NSNumber numberWithInteger: v]


@implementation floodMainViewController


ModelCode *myModel ;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
   myModel = [[ModelCode alloc] init ];

    

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setRainAreaLabel:nil];
    [self setAnnualRainfall:nil];
    [self setRainAreaLabel:nil];
    [self setSoilTypeLabel:nil];
    [self setReturnPeriodLabel:nil];
    [self setPercentCleared:nil];
    [self setCatchmentCleared:nil];
    [self setMainstreamLabel:nil];
    [self setSlopeLabel:nil];
    [self setLabelBlockTest:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(floodFlipsideViewController *)controller
{
    [self.flipsidePopoverController dismissPopoverAnimated:YES];
    self.flipsidePopoverController = nil;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
        self.flipsidePopoverController = popoverController;
        popoverController.delegate = self;
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}


-(void) showRainResults:(RainData *)isRain
{
      [self.rainPickerPopover dismissPopoverAnimated:YES];
    _rainAreaLabel.text  = [NSString stringWithFormat:@" %@",isRain.rainfall_area];
    _annualRainfall.text = [NSString stringWithFormat:@"Annual rainfall %@ mm",isRain.rainfall_year];
   
    NSLog(@"Rain %@",isRain);
  
    
    myModel.rainAreaDescription = isRain.rainfall_area;
    myModel.rainfall_year = isRain.rainfall_year;
    myModel.rainfall_index = isRain.rainfall_index;
    myModel.rainfall_hour = isRain.rainfall_hour;
    myModel.rainfall_coeff = isRain.rainfall_coeff;

    
}



-(void)showReturnPeriodResults:(int) isRainEvent : (NSString *) yearsReturn
{
  
    [self.rainEventTypePickerPopover dismissPopoverAnimated:YES];
       
    _returnPeriodLabel.text  = [NSString stringWithFormat:@"Return Period %@ ",yearsReturn];
    
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    
    myModel.returnPeriod = [f numberFromString:yearsReturn];
    NSLog(@"%@",myModel.returnPeriod );
    
}

-(void) showSlopeResults:(int)isSlope
{
   
    [self.slopePickerPopover dismissPopoverAnimated:YES];
    
    myModel.slope = @(isSlope);
    
    
    
}

-(void) showSoilTypeResults:(Soil_Manning *)isSoilType
{
    NSLog(@"Soil Type %@",isSoilType);
    [self.soilTypePickerPopover dismissPopoverAnimated:YES];
    _soilTypeLabel.text  = [NSString stringWithFormat:@" %@",isSoilType.soiltype];
    
    myModel.soiltype      = isSoilType.soiltype;
    myModel.manning_coeff = isSoilType.manning_coeff;
    myModel.manning_index = isSoilType.manning_index;
    myModel.max_velocity  = isSoilType.max_velocity;
    
    
}

- (IBAction)percentSlider:(UISlider *)sender {
    
    _percentCleared.text = [NSString stringWithFormat:@" Percent cleared %.0f %%", [sender value]]; 
    
    myModel.percentCleared = @([sender value]);

}

- (IBAction)mainStreamSlider:(UISlider *)sender {
    _mainstreamLabel.text = [NSString stringWithFormat:@" Mainstream length %.0f (m)", [sender value]]; 
    myModel.mainstream = @([sender value]);

}

- (IBAction)slopeSlider:(UISlider *)sender {
   
         _slopeLabel.text = [NSString stringWithFormat:@"Slope %.0f %%", [sender value]]; 
         myModel.slope = @([sender value]);

    
}






- (IBAction)blockTest:(id)sender {
    
    
    
    dispatch_queue_t queue;
    queue =dispatch_queue_create("com.entretec.queue1", DISPATCH_QUEUE_SERIAL);
    
    printf("Before async \n");
    dispatch_async(queue, ^{printf("Hello World\n");
    });
    
    printf("After async \n");
    
    
   
}


- (IBAction)catchmentSlider:(UISlider *)sender {
    
    _catchmentCleared.text = [NSString stringWithFormat:@" Catchment area %.0f Ha", [sender value]]; 
    myModel.catchmentCleared = @([sender value]);

}



- (IBAction)btnRainTapped:(UIButton *)sender {
    if (_rainPicker == nil) {
        
        self.rainPicker = [[RainViewController alloc]initWithStyle:UITableViewStylePlain];
        
        _rainPicker.delegateRain = self;
        
        self.rainPickerPopover = [[UIPopoverController alloc] initWithContentViewController:_rainPicker];               
    }
    [self.rainPickerPopover presentPopoverFromRect:sender.frame 
                                            inView:[self view] 
                          permittedArrowDirections:UIPopoverArrowDirectionAny 
                                          animated:YES];
    
}

- (IBAction)btnSoilTypeTapped:(UIButton *)sender {
    
    if (_soilTypePicker == nil) {
        
        self.soilTypePicker = [[SoilTypeViewController alloc]initWithStyle:UITableViewStylePlain];
         _soilTypePicker.delegateSoilType = self;
        self.soilTypePickerPopover = [[UIPopoverController alloc] initWithContentViewController:_soilTypePicker];               
    }

    
    [self.soilTypePickerPopover presentPopoverFromRect:sender.frame 
                                                inView:[self view] 
                              permittedArrowDirections:UIPopoverArrowDirectionAny 
                                              animated:YES];

}

- (IBAction)btnReturnPeriod:(UIButton *)sender {
    
    if (_rainEventTypePicker == nil) {
        
        self.rainEventTypePicker = [[returnPeriodViewController alloc] init];
            
        _rainEventTypePicker.delegateEvent = self;

        self.rainEventTypePickerPopover = [[UIPopoverController alloc] initWithContentViewController:_rainEventTypePicker];
    }
    
    
   [self.rainEventTypePickerPopover presentPopoverFromRect:sender.frame inView:[self view] permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
  

}




@end
