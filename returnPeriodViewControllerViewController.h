//
//  returnPeriodViewControllerViewController.h
//  flood_draft_2
//
//  Created by Mick Brown on 29/05/12.
//  Copyright (c) 2012 Entretec Pty Ltd. All rights reserved.


#import <UIKit/UIKit.h>


@protocol returnPeriodPickerDelegate
- (void)showReturnPeriodResults:(int) isRainEvent : (NSString *) yearsReturn;
@end



@interface returnPeriodViewController : UIViewController <UIPickerViewDelegate>


{
        // UIButton *doneButton ;
    UIPickerView * myPickerView;
 
    NSArray * rainEvents ;
    
    
}

    //-(IBAction) doneButton:(UIButton *)sender;

-(IBAction)aMethod:(id)sender;

@property (strong,nonatomic)     UIButton *doneButton ;

@property (nonatomic)    int resultRow;
@property (nonatomic, strong)    NSString *yearsReturn;


@property (strong, nonatomic) id <returnPeriodPickerDelegate> delegateEvent;



@end
