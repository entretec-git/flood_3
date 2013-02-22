//
//  floodMainViewController.h
//  flood_draft1
//
//  Created by Mick Brown on 25/05/12.
//  Copyright (c) 2012 Entretec Pty Ltd. All rights reserved.

#import <Foundation/Foundation.h>

#import "floodFlipsideViewController.h"
#import "RainViewController.h"
#import "RainData.h"
#import "SlopeViewController.h"
#import "SoilTypeViewController.h"
#import "returnPeriodViewControllerViewController.h"

@interface floodMainViewController : UIViewController <
            floodFlipsideViewControllerDelegate, 
            UIPopoverControllerDelegate,
            RainPickerDelegate,
            SlopePickerDelegate,
            SoilTypePickerDelegate,
            returnPeriodPickerDelegate  >
{

}


@property (nonatomic, strong) NSManagedObjectContext        *managedObjectContext;
@property (nonatomic, strong) UIPopoverController           *flipsidePopoverController;
@property (nonatomic, strong) UIPopoverController           *rainPickerPopover;
@property (nonatomic, strong) RainViewController            *rainPicker;
@property (nonatomic, strong) UIPopoverController           *slopePickerPopover;
@property (nonatomic, strong) slopeViewController           *slopePicker;
@property (nonatomic, strong) UIPopoverController           *soilTypePickerPopover;
@property (nonatomic, strong) SoilTypeViewController        *soilTypePicker;
@property (nonatomic, strong) UIPopoverController           *rainEventTypePickerPopover;
@property (nonatomic, strong) returnPeriodViewController    *rainEventTypePicker;

@property (weak, nonatomic) IBOutlet UILabel *annualRainfall;
@property (weak, nonatomic) IBOutlet UILabel *rainAreaLabel;
@property (weak, nonatomic) IBOutlet UILabel *soilTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *returnPeriodLabel;
@property (weak, nonatomic) IBOutlet UILabel *percentCleared;
@property (weak, nonatomic) IBOutlet UILabel *catchmentCleared;
@property (weak, nonatomic) IBOutlet UILabel *mainstreamLabel;

@property (weak, nonatomic) IBOutlet UILabel *slopeLabel;

- (IBAction)btnRainTapped:(UIButton *)sender;

- (IBAction)btnSoilTypeTapped:(UIButton *)sender;

- (IBAction)btnReturnPeriod:(UIButton *)sender;

- (IBAction)catchmentSlider:(UISlider *)sender;

- (IBAction)percentSlider:(UISlider *)sender;

- (IBAction)mainStreamSlider:(UISlider *)sender;

- (IBAction)slopeSlider:(UISlider *)sender;

- (IBAction)blockTest:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *labelBlockTest;

-(void) showReturnPeriodResults:    (int)  isRainEvent : (NSString *) yearsReturn;
-(void) showSoilTypeResults:        (Soil_Manning *)    isSoilType;
-(void) showSlopeResults:           (int)               isSlope;
-(void) showRainResults:            (RainData *)        isRain;







@end
