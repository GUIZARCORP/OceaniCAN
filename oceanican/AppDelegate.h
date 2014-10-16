//
//  AppDelegate.h
//  oceanican
//
//  Created by Guillermo Guizar on 12/10/14.
//  Copyright (c) 2014 Guillermo Guizar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "CRGradientNavigationBar.h"
#import "SideMenuViewController.h"
#import "MFSideMenuContainerViewController.h"
#import "OceaniCANMainViewController.h"



@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) OceanicanMainViewController *mainView;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

-(void)loadMenuWithData:(NSMutableArray*) data;


@end

