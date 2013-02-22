//
//  SoilTypeViewController.h
//  flood_draft_2
//
//  Created by Mick Brown on 28/05/12.
//  Copyright (c) 2012 Entretec Pty Ltd. All rights reserved.

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "CoreDataTableViewController.h"
#import "NSObject+Category_Sets.h"
#import "RainData.h"


@protocol SoilTypePickerDelegate
- (void)showSoilTypeResults:(Soil_Manning  *) isSoilType;
@end

@interface SoilTypeViewController : CoreDataTableViewController


@property (strong, nonatomic) IBOutlet UITableViewCell *EmptyRainCell;

    //@property (strong, nonatomic) NSArray * raindatas;
@property (strong, nonatomic) id <SoilTypePickerDelegate> delegateSoilType;
@end
