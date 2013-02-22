//
//  floodAppDelegate.h
//  flood_draft1
//
//  Created by Mick Brown on 25/05/12.
//  Changed by iMac27






#import <UIKit/UIKit.h>

@interface floodAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void)createEditableCopyOfDatabaseIfNeeded;
@end
