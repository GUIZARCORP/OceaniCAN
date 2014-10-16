//
//  AppDelegate.m
//  oceanican
//
//  Created by Guillermo Guizar on 12/10/14.
//  Copyright (c) 2014 Guillermo Guizar. All rights reserved.
//

#import "AppDelegate.h"
#import "OceaniCANMainViewController.h"
#import "MFSideMenu.h"
#import "OceanicanAdoptionTableViewController.h"
#import "SideMenuViewController.h"
#import "MFSideMenuContainerViewController.h"
#import "ProgressHUD.h"



@implementation AppDelegate


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOption
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    SideMenuViewController *leftMenuViewController = [[SideMenuViewController alloc] init];
    SideMenuViewController *rightMenuViewController = [[SideMenuViewController alloc] init];
    
    MFSideMenuContainerViewController *container = [MFSideMenuContainerViewController
                                                    containerWithCenterViewController:[self navigationController]
                                                    leftMenuViewController:leftMenuViewController
                                                    rightMenuViewController:nil];

    
    //    self.window.rootViewController = container;
    //    [self.window makeKeyAndVisible];
    
    leftMenuViewController.view.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:52.0/255.0 blue:52.0/255.0 alpha:1];
    CGRect frame = leftMenuViewController.view.frame;
    frame.origin.x = 300 - frame.size.width;
    frame.origin.y = 300 - frame.size.height;
    leftMenuViewController.view.frame = frame;
    
    rightMenuViewController.view.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:52.0/255.0 blue:52.0/255.0 alpha:1];
    CGRect frame2 = rightMenuViewController.view.frame;
    frame2.origin.x = 300 - frame2.size.width;
    frame2.origin.y = 300 - frame2.size.height;
    rightMenuViewController.view.frame = frame2;
    
    
    
    
    NSArray *elementsMenu= [NSArray arrayWithObjects:
                            [NSArray arrayWithObjects:
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",nil],
                            [NSArray arrayWithObjects:
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",
                             nil]
                            ,nil];
    leftMenuViewController.elementsMenu = [elementsMenu objectAtIndex:0];
    leftMenuViewController.imagesMenu = [elementsMenu objectAtIndex:1];
    leftMenuViewController.tableView.showsVerticalScrollIndicator = NO;
    leftMenuViewController.view.frame = CGRectMake(leftMenuViewController.view.frame.origin.x, leftMenuViewController.view.frame.origin.y, leftMenuViewController.view.frame.size.width, leftMenuViewController.view.frame.size.height + 30);
    
    
    rightMenuViewController.elementsMenu = [elementsMenu objectAtIndex:0];
    rightMenuViewController.imagesMenu = [elementsMenu objectAtIndex:1];
    rightMenuViewController.tableView.showsVerticalScrollIndicator = NO;
    rightMenuViewController.view.frame = CGRectMake(rightMenuViewController.view.frame.origin.x, rightMenuViewController.view.frame.origin.y, rightMenuViewController.view.frame.size.width, rightMenuViewController.view.frame.size.height + 30);
    
    self.window.rootViewController = container;
    
    
    self.window.backgroundColor = [UIColor clearColor];
    [self.window makeKeyAndVisible];
    
    return YES;

}


#pragma mark others
- (UINavigationController *)navigationController {
    self.mainView = [[OceanicanMainViewController alloc] initWithNibName:@"OceanicanMainViewController" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithNavigationBarClass:[CRGradientNavigationBar class] toolbarClass:nil];
    
    //UIColor *firstColor = [UIColor colorWithRed: 255.0f/255.0f green:82.0f/255.0f blue:104.0f/255.0f alpha:1.0f];
    //UIColor *secondColor = [UIColor colorWithRed:255.0f/255.0f green:82.0f/255.0f blue:104.0f/255.0f alpha:1.0f];
    //NSArray *colors = [NSArray arrayWithObjects:(id)firstColor.CGColor, (id)secondColor.CGColor, nil];
    
    //[[CRGradientNavigationBar appearance] setBarTintGradientColors:colors];
    //[[navigationController navigationBar] setTranslucent:NO]; // Remember, the default value is YES.
        
    [[navigationController navigationBar] setBarTintColor: [UIColor colorWithRed: 229/255.0f green:229/255.0f blue:229/255.0f alpha:1.0f]];
    
    
    [navigationController setViewControllers:@[self.mainView]];
    return navigationController;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "Guizarcorp.oceanican" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"oceanican" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"oceanican.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}


#pragma mark loadMenu function
-(void)loadMenuWithData:(NSMutableArray*) data{
    
    MFSideMenuContainerViewController *container = (MFSideMenuContainerViewController *)self.window.rootViewController;
    SideMenuViewController *leftMenuViewController = (SideMenuViewController *)container.leftMenuViewController;
    
    
    NSArray *elementsMenu= [NSArray arrayWithObjects:
                            [NSArray arrayWithObjects:
                             @"Perfil",
                             @"Grupos",
                             @"Inbox",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"Acerca de",nil],
                            [NSArray arrayWithObjects:
                             @"icon_traffic.png",
                             @"icon_classifieds.png",
                             @"icon_urban_apps.png",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"",
                             @"icon_about.png",
                             nil]
                            ,nil];
    
    int k = 0;
    NSMutableArray *items = [[NSMutableArray alloc] init];
    for (k = 0; k < [data count]; k++)
    {
        NSString *name =  [[data objectAtIndex:k] objectForKey:@"nombre"];
        NSString *gender = [[data objectAtIndex:k] objectForKey:@"genero"];
        NSString *despa =  [[data objectAtIndex:k] objectForKey:@"desparacitado"];
        NSString *situation = [[data objectAtIndex:k] objectForKey:@"situacion"];
        NSString *color = [[data objectAtIndex:k] objectForKey:@"color"];
        NSString *inDate = [[data objectAtIndex:k] objectForKey:@"fecha_ingreso"];
        NSString *outDate = [[data objectAtIndex:k] objectForKey:@"fecha_adopcion"];
        NSString *age = [[data objectAtIndex:k] objectForKey:@"edad"];
        NSString *code = [[data objectAtIndex:k] objectForKey:@"codigo"];
        NSString *picture = [[data objectAtIndex:k] objectForKey:@"foto"];
        NSString *size = [[data objectAtIndex:k] objectForKey:@"tamano"];
        NSString *energy = [[data objectAtIndex:k] objectForKey:@"nivel_energia"];
        NSString *description = [[data objectAtIndex:k] objectForKey:@"descripcion"];
        

        NSMutableDictionary *item = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                     name, @"nombre",
                                     despa, @"desparacitado",
                                     gender, @"genero",
                                     situation, @"situacion",
                                     color, @"color",
                                     inDate, @"fecha_ingreso",
                                     outDate, @"fecha_adopcion",
                                     age, @"edad",
                                     code,@"codigo",
                                     picture,@"foto",
                                     size,@"tamano",
                                     energy,@"nivel_energia",
                                     description,@"descripcion",
                                     nil];
        [items addObject:item];
    }
    
    
    //leftMenuViewController.elementsMenu = [elementsMenu2 objectAtIndex:0];
    leftMenuViewController.elementsMenu = [elementsMenu objectAtIndex:0];
    leftMenuViewController.elementsMenu2 = items;
    [leftMenuViewController.tableView reloadData];

}



@end
