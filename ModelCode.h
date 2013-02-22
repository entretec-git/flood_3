//
//  ModelCode.h
//  flood_draft_2
//
//  Created by Mick Brown on 28/05/12.
//  Copyright (c) 2012 Entretec Pty Ltd. All rights reserved.


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "CoreDataTableViewController.h"
#import "NSObject+Category_Sets.h"
#import "floodAppDelegate.h"



@interface ModelCode : NSObject
{    
}

@property (nonatomic, strong) NSString   *rainAreaDescription;      // ie Duranillin
@property (nonatomic, strong) NSNumber   *rainfall_year;            // "rainfall_year" = 556;
@property (nonatomic, strong) NSNumber   *rainfall_index;           // "rainfall_index" = 11;
@property (nonatomic, strong) NSNumber   *rainfall_hour;            // "rainfall_hour" = "5.2";
@property (nonatomic, strong) NSNumber   *rainfall_coeff;           // "rainfall_coeff" = "0.81";

@property (nonatomic, retain) NSString  * soiltype;
@property (nonatomic, retain) NSNumber  * manning_coeff;
@property (nonatomic, retain) NSNumber  * manning_index;
@property (nonatomic, retain) NSNumber  * max_velocity;

@property (nonatomic, strong) NSNumber   *slope;

@property (nonatomic, strong) NSNumber   *returnPeriod;

@property (nonatomic, strong) NSNumber   *percentCleared;

@property (nonatomic, strong) NSNumber   *catchmentCleared;

@property (nonatomic, strong) NSNumber   *mainstream;
   
    // entrance design
@property (nonatomic, retain) NSNumber * entrancecoeff;
@property (nonatomic, retain) NSString * entrancedesign;

    // get value
@property (nonatomic, retain) NSNumber * getvalue_choice;
@property (nonatomic, retain) NSNumber * getvalue_index;
@property (nonatomic, retain) NSNumber * getvalue_qe5;
@property (nonatomic, retain) NSNumber * getvalue_years;
@property (nonatomic, retain) NSNumber * id_loc;


-(void) calculationObserver;


@end
