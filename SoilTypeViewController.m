//
//  SoilTypeViewController.m
//  flood_draft_2
//
//  Created by Mick Brown on 28/05/12.
//  Copyright (c) 2012 Entretec Pty Ltd. All rights reserved.

#import "SoilTypeViewController.h"

@interface SoilTypeViewController ()

@end

@implementation SoilTypeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)doFetchedResultsController // attaches an NSFetchRequest to this UITableViewController
{
    floodAppDelegate *appDelegate = [UIApplication thisApp];
    NSManagedObjectContext *context =  [appDelegate managedObjectContext];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Soil_Manning"];
    
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"soiltype" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
    
        //    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(soiltype contains[c] %@)",@"ing"];
        //    [request setPredicate:pred];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:context
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(450.0, 640.0);
    
    [self doFetchedResultsController];

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

#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath                                 
{
        //cell.contentView.backgroundColor = [UIColor blackColor];
    [[cell textLabel] setTextColor:[UIColor blackColor]];
        // [[cell textLabel] setTextColor:[UIColor colorWithRed:255.0/255.0 green:76.0/255.0 blue:76.0/255.0 alpha:1]];
    
    [[cell textLabel] setFont:[UIFont fontWithName:@"HelveticaLT-Compressed" size:22]];
    
    
}
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  indexPath;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *MyIdentifier = @"SoilTypeCell";
    
    
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
            //        [[NSBundle mainBundle] loadNibNamed:@"EmptyRainCellHolder" owner:self options:nil];
            //        
            //        cell=_EmptyRainCell;
        
        
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
        
    }
    
        // RainData * rain = [raindatas objectAtIndex:indexPath.row];
    Soil_Manning * soil =[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = soil.soiltype;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Max Velocity%@ mm" ,soil.max_velocity];
    return cell;
    
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (_delegateSoilType != nil) { 
        Soil_Manning * soil =[self.fetchedResultsController objectAtIndexPath:indexPath];
        [_delegateSoilType showSoilTypeResults:soil];
        
    }
    
    
    
        // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}



@end
