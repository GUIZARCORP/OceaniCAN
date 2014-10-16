//
//  OceanicanMainViewController.m
//  oceanican
//
//  Created by Guillermo Guizar on 12/10/14.
//  Copyright (c) 2014 Guillermo Guizar. All rights reserved.
//

#import "OceanicanMainViewController.h"
#import "OceaniCANMainViewController.h"
#import "MFSideMenu.h"
#import "SideMenuViewController.h"
#import "MFSideMenuContainerViewController.h"
#import "requestAsync.h"
#import "AppDelegate.h"
#import "ProgressHUD.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "OceanicanFacebookViewController.h"
#import "aboutViewController.h"
#import "OceanicanDonateViewController.h"
#import "OceanicanContactViewController.h"


@interface OceanicanMainViewController ()

@end

@implementation OceanicanMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"OceaniCAN";
    self.navigationItem.leftBarButtonItem = [self leftMenuBarButtonItem];
    [self loadcover];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) loadcover
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSURL *url = [NSURL URLWithString:@"https://graph.facebook.com/oceanican?fields=cover"];
    NSDictionary *data_request_all = [NSDictionary dictionaryWithObjectsAndKeys:@"", @"username",nil, @"password",  nil];
    ASIHTTPRequest *requestAll = [requestAsync requestUrlAuthenticationAsync:url andType:@"GET" withValues:data_request_all];
    
    [requestAll setCompletionBlock:^{

        [self fetchedCover:[requestAll responseData]];
    }];
    [requestAll setFailedBlock:^{
        //        NSError *error = [requestAll error];
        //        NSLog(@"rerror %@", error);
    }];
    [requestAll startAsynchronous];
    
}


-(void)fetchedCover:(NSData*)data
{
    NSError *error=nil;
    if (data!=nil) {

        //[ProgressHUD show:@"Cargando..." Interaction:NO];

        NSDictionary *data_ = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if ([data_ count] > 0)
        {
            NSString *coverData = [[data_ objectForKey:@"cover"]objectForKey:@"source"];

            // Here we use the new provided setImageWithURL: method to load the web image
            [self.slideCover sd_setImageWithURL:[NSURL URLWithString:coverData]
                           placeholderImage:[UIImage imageNamed:@"placeholder.png"]];

            [self loadData];

            
        }
    }
    

}



- (void) loadData
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    NSURL *url = [NSURL URLWithString:@"http://api.oceanican.com/adopcion"];
    NSDictionary *data_request_all = [NSDictionary dictionaryWithObjectsAndKeys:@"", @"username",nil, @"password",  nil];
    ASIHTTPRequest *requestAll = [requestAsync requestUrlAuthenticationAsync:url andType:@"GET" withValues:data_request_all];
    
    [requestAll setCompletionBlock:^{
        
        [self fetchedDataInfo:[requestAll responseData]];
    }];
    [requestAll setFailedBlock:^{
        //        NSError *error = [requestAll error];
        //        NSLog(@"rerror %@", error);
    }];
    [requestAll startAsynchronous];
    
}


-(void)fetchedDataInfo:(NSData*)data
{
    self.dogs = [[NSMutableArray alloc] initWithArray:nil];
    NSError *error=nil;
    if (data!=nil) {
        NSDictionary *data_ = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if ([data_ count] > 0)
        {
            long dogsIndex = [[data_ objectForKey:@"result"] count];
            
            for (int i = 0; i< dogsIndex; i++)
            {
                NSDictionary *dogsData = [[NSDictionary alloc] init];
                dogsData = [[data_ objectForKey:@"result"]objectAtIndex:i];
                
                NSString *name =  [dogsData objectForKey:@"nombre"];
                NSString *despa =  [[dogsData objectForKey:@"desparacitado"] objectAtIndex:0];
                NSString *gender = [dogsData objectForKey:@"genero"];
                NSString *situation = [dogsData objectForKey:@"situacion"];
                NSString *color = [dogsData objectForKey:@"color"];
                NSString *inDate = [dogsData objectForKey:@"fecha_ingreso"];
                NSString *outDate = [dogsData objectForKey:@"fecha_adopcion"];
                NSString *age = [dogsData objectForKey:@"edad"];
                NSString *code = [dogsData objectForKey:@"codigo"];
                NSString *picture = [dogsData objectForKey:@"foto"];
                NSString *size = [dogsData objectForKey:@"tamano"];
                NSString *energy = [dogsData objectForKey:@"nivel_energia"];
                NSString *description = [dogsData objectForKey:@"descripcion"];

                outDate = [NSString stringWithFormat:@"%@", outDate];
                
                if([dogsData objectForKey:@"fecha_adopcion"] == [NSNull null]){
                    outDate = @"";
                }
                
                NSMutableDictionary *itemPeople = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                                   name, @"nombre",
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
                                                   despa, @"desparacitado",
                                                   nil];
                [self.dogs addObject:itemPeople];
            }
        }
    }
    
    //[ProgressHUD dismiss];
    [ProgressHUD showSuccess:@"¡Datos cargados!" Interaction:NO];

    [(AppDelegate *)[[UIApplication sharedApplication] delegate] loadMenuWithData:(self.dogs)];

}






#pragma mark custom

- (UIBarButtonItem *)leftMenuBarButtonItem
{
    UIButton *configButon2 = [UIButton buttonWithType:0];
    configButon2.frame = CGRectMake(0, 0, 20, 20);
    [configButon2 addTarget:self  action:@selector(leftSideMenuButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [configButon2 setImage:[UIImage imageNamed:@"menu_logo.png"] forState:UIControlStateNormal];
    [configButon2 setImage:[UIImage imageNamed:@"menu_logo.png"] forState:UIControlStateHighlighted];
    configButon2.backgroundColor=[UIColor clearColor];
    //    if(1)
    configButon2.contentEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0);
    //    else
    //        configButon2.contentEdgeInsets = UIEdgeInsetsMake(-1, -10, 0, 0);
    return  [[UIBarButtonItem alloc] initWithCustomView:configButon2];
}


- (void)leftSideMenuButtonPressed:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:^{
        //
        //        SideMenuViewController *members = [[SideMenuViewController alloc] init];
        //        members.elementsMenu = activeGroups;
        [self setupMenuBarButtonItems];
    }];
}


- (void)setupMenuBarButtonItems {
    
    if(self.menuContainerViewController.menuState == MFSideMenuStateClosed &&
       ![[self.navigationController.viewControllers objectAtIndex:0] isEqual:self])
    {
        //        self.navigationItem.leftBarButtonItem = [self backBarButtonItem];
    }
    else
    {
        self.navigationItem.leftBarButtonItem = [self leftMenuBarButtonItem];
    }
}



- (IBAction)AboutOceanican:(id)sender
{
    
    aboutViewController *adoptionControllerVa = [[aboutViewController alloc] init];
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    self.menuContainerViewController.panMode = MFSideMenuPanModeNone;
    [navigationController setNavigationBarHidden:NO animated:NO];
    [navigationController pushViewController:adoptionControllerVa animated:NO];
//    
//    aboutOceanicanViewController *aboutController = [[aboutOceanicanViewController alloc] init];
//    [self.navigationController pushViewController:aboutController animated:YES];
}

- (IBAction)donateOceanican:(id)sender {
    OceanicanDonateViewController *donateControllerVa = [[OceanicanDonateViewController alloc] init];
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    self.menuContainerViewController.panMode = MFSideMenuPanModeNone;
    [navigationController setNavigationBarHidden:NO animated:NO];
    [navigationController pushViewController:donateControllerVa animated:NO];
}

- (IBAction)contactOceanican:(id)sender {
    OceanicanContactViewController *donateControllerVa = [[OceanicanContactViewController alloc] init];
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    self.menuContainerViewController.panMode = MFSideMenuPanModeNone;
    [navigationController setNavigationBarHidden:NO animated:NO];
    [navigationController pushViewController:donateControllerVa animated:NO];
}
@end
