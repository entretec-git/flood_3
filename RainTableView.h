//
//  RainTableView.h
//  sets
//
//  Created by Mick Brown on 23/05/12.
//  Copyright (c) 2012 Entretec Pty Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "CoreDataTableViewController.h"
#import "NSObject+Category_Sets.h"
#import "RainData.h"

@class RainTableView;


@protocol RainPickerDelegate
- (void)showRainResults:(RainData  *) isRain;
@end



@interface RainTableView : CoreDataTableViewController


{
        // NSArray *raindatas;

}

@property (strong, nonatomic) IBOutlet UITableViewCell *EmptyRainCell;

    //@property (strong, nonatomic) NSArray * raindatas;
@property (strong, nonatomic) id <RainPickerDelegate> delegateRain;

@end
 