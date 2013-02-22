//
//  RainViewController.h
//  flood_draft1
//
//  Created by Mick Brown on 25/05/12.
//  Copyright (c) 2012 Entretec Pty Ltd. All rights reserved.


    //#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "CoreDataTableViewController.h"
#import "NSObject+Category_Sets.h"
#import "RainData.h"

@protocol RainPickerDelegate
- (void)showRainResults:(RainData  *) isRain;
@end


@interface RainViewController : CoreDataTableViewController

@property (strong, nonatomic) IBOutlet UITableViewCell *EmptyRainCell;

    //@property (strong, nonatomic) NSArray * raindatas;
@property (strong, nonatomic) id <RainPickerDelegate> delegateRain;


- (void)doFetchedResultsController;

@end
