//
//  SlopeViewController.h
//  flood_draft2
//
//  Created by Mick Brown on 26/05/12.
//  Copyright (c) 2012 Entretec Pty Ltd. All rights reserved.


#import <UIKit/UIKit.h>

@protocol SlopePickerDelegate
- (void)showSlopeResults:(int) isSlope;
@end



@interface slopeViewController : UIViewController <UIPickerViewDelegate>
{
        //UIButton *doneButton ;
    UIPickerView * myPickerView;
        //  NSInteger * result;
    
}

    //-(IBAction) doneButton:(UIButton *)sender;

-(IBAction)aMethod:(id)sender;

@property (strong,nonatomic)     UIButton *doneButton ;

@property (nonatomic)    int result;

@property (strong, nonatomic) id <SlopePickerDelegate> delegateSlope;


@end
