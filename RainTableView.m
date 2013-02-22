//
//  RainTableView.m
//  sets
//
//  Created by Mick Brown on 23/05/12.
//  Copyright (c) 2012 Entretec Pty Ltd. All right   reserved.
//

#import "RainTableView.h"
    //#import "RainData.h"


@interface RainTableView ()

@end

@implementation RainTableView
@synthesize EmptyRainCell = _EmptyRainCell;
@synthesize delegateRain = _delegateRain;
    //@synthesize raindatas = _raindatas;

    

- (void)doFetchedResultsController // attaches an NSFetchRequest to this UITableViewController
{
    floodAppDelegate *appDelegate = [UIApplication thisApp];
    NSManagedObjectContext *context =  [appDelegate managedObjectContext];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"RainData"];
    
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"rainfall_area" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)]];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(rainfall_area contains[c] %@)",@"ing"];
    [request setPredicate:pred];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:context
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(250.0, 440.0);
    
    [self doFetchedResultsController];

}

- (void)viewDidUnload
{
    [self setEmptyRainCell:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
    
    static NSString *MyIdentifier = @"EmptyRainCell";

    
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"EmptyRainCellHolder" owner:self options:nil];
        
         cell=_EmptyRainCell;
        
        
        
            //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"RainCell"];
    
    }
    
        // RainData * rain = [raindatas objectAtIndex:indexPath.row];
    RainData * rain =[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = rain.rainfall_area;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Annual rainfall %@ mm" ,rain.rainfall_year];
    return cell;

}




#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
       if (_delegateRain != nil) { 
        RainData * rain =[self.fetchedResultsController objectAtIndexPath:indexPath];
    [_delegateRain showRainResults:rain];
    
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
