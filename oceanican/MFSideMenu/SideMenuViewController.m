//
//  SideMenuViewController.m
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import "SideMenuViewController.h"
#import "MFSideMenu.h"
#import <QuartzCore/QuartzCore.h>
#import "OceanicanAdoptionTableViewController.h"
#import "OceanicanFacebookViewController.h"
#import "OceanicanTwitterViewController.h"





@implementation SideMenuViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

@synthesize elementsMenu,imagesMenu;

#pragma mark -
#pragma mark - UITableViewDataSource


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    _collapsable = 1;
    self.parentViewController.view.backgroundColor = [UIColor blackColor];
}

-(void)viewWillAppear:(BOOL)animated
{
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    [self.tableView reloadData];
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    self.tableView.backgroundColor = [UIColor blackColor];
    
    //[[UIImageView alloc] initWithImage:
                                    // [UIImage imageNamed:@"us-menu-background.png"]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor = [UIColor clearColor];

    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0)
        return 0;
    if (section == 1)
        return 0;
    if (section == 2)
        return 0;
    if (section == 3)
        return 0;
    if (section == 4)
        return 0;
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if(indexPath.row > 0 && indexPath.row == [self.elementsMenu count] -3 && [[ UIScreen mainScreen ] bounds ].size.height > 480.00)
        cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    else
        cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:17.0/255.0 green:65.0/255.0 blue:92.0/255.0 alpha:.5];
        [[cell textLabel] setTextColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]];
    
    
    if (indexPath.section == 0)
    {
        
    }

    if (indexPath.section == 1)
    {
    }

    if (indexPath.section == 2)
    {
    }
    
    if (indexPath.section == 3)
    {
    }
    
    if (indexPath.section == 4)
    {
    }
    //cell.imageView.image = [UIImage imageNamed:[self.imagesMenu objectAtIndex:indexPath.row] ];
    return cell;
}


#pragma mark -
#pragma mark - UITableViewDelegate



-(void)enableMenu{
    self.valid = self.valid + 1;
    if(timer && self.valid >= 3)
    {
        [timer invalidate];
        timer = nil;
        self.valid = 0;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(!timer)
        timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(enableMenu) userInfo:nil repeats:YES];
    if(self.valid == 0){
        self.valid = self.valid + 1;
        
}
    

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

//    if(Leftmenu != (0) && Leftmenu != (1))
//    {
//        Leftmenu = YES;
//    }
//    
//    if(Leftmenu == YES)
//    {
//        if (indexPath.section == 0)
//        {
//            cell.backgroundColor = [UIColor colorWithRed:61/255.0 green:21/255.0 blue:25/255.0 alpha:0.5];
//        }
//        else if (indexPath.section == 1)
//        {
//            cell.backgroundColor = [UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:0.05];
//        }
//        else
//        {
//            cell.backgroundColor = [UIColor clearColor];
//        }
//    }
//    else
//    {
//    cell.backgroundColor = [UIColor clearColor];
//    }
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        if (indexPath.section == 0)
        {
            return 60;
        }
        if (indexPath.section == 1)
        {
            return 60;
        }
        return 60;
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    
    NSArray *ver = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];
    if ([[ver objectAtIndex:0] intValue] >= 7) {
       
    }

        if ([[ver objectAtIndex:0] intValue] >= 7) {
            if(section == 0)
                return 70;
        }
        else
        {
            if(section == 0)
                return 60;
        }

    if(section == 1)
        return 50;
    if(section == 2)
        return 50;
    if(section == 3)
        return 50;
    if(section == 4)
        return 50;

    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}



- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//        if(section == 0)
//        {
//            UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 20)];
//            UIImageView *headerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"safe.png"]];
//            headerImage.frame = CGRectMake(0, 20, tableView.bounds.size.width, 60);
//            [headerView addSubview:headerImage];
//            return headerView;
//        }
        if(section == 0)
        {
            UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 20)];
            UIImageView *imageView1=[[UIImageView alloc]init];
            UIButton *dropdownbutton=[UIButton buttonWithType:UIButtonTypeCustom];
            dropdownbutton.frame=CGRectMake(0, 10, tableView.bounds.size.width, 40);
            imageView1.image=[UIImage imageNamed:@"us-groups.png"];
            imageView1.frame=CGRectMake(15, 0, 35, 35);
            dropdownbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [dropdownbutton addSubview:imageView1];
            dropdownbutton.titleEdgeInsets = UIEdgeInsetsMake(30, 60, 0, 0);
            [dropdownbutton setTitle:@"OceaniCAN" forState:UIControlStateNormal];
            [dropdownbutton setTitleColor:[UIColor whiteColor ]forState: UIControlStateNormal];
            [dropdownbutton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0]];
            [dropdownbutton addTarget:self action:@selector(mainController) forControlEvents:UIControlEventTouchUpInside];
            [customView addSubview:dropdownbutton];
            
            return customView;
        }
        
        if(section == 1)
        {
            UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 20)];
            UIImageView *imageView1=[[UIImageView alloc]init];
            UIButton *dropdownbutton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            dropdownbutton.frame=CGRectMake(0, 10, tableView.bounds.size.width, 40);
            imageView1.image=[UIImage imageNamed:@"us-mail.png"];
            imageView1.frame=CGRectMake(15, 0, 35, 30);
            dropdownbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [dropdownbutton addSubview:imageView1];
            
            
            dropdownbutton.titleEdgeInsets = UIEdgeInsetsMake(-8, 60, 0, 0);
            [dropdownbutton setTitle:@"Facebook" forState:UIControlStateNormal];
            [dropdownbutton setTitleColor:[UIColor whiteColor ]forState: UIControlStateNormal];
            [dropdownbutton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0]];
            [dropdownbutton addTarget:self action:@selector(facebookController) forControlEvents:UIControlEventTouchUpInside];
            
            [customView addSubview:dropdownbutton];
            
            
            return customView;
        }
        
        if(section == 2)
        {
            UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 20)];
            UIImageView *imageView1=[[UIImageView alloc]init];
            UIButton *dropdownbutton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            dropdownbutton.frame=CGRectMake(0, 10, tableView.bounds.size.width, 40);
            imageView1.image=[UIImage imageNamed:@"us-acercade.png"];
            imageView1.frame=CGRectMake(15, 0, 30, 30);
            dropdownbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [dropdownbutton addSubview:imageView1];
            dropdownbutton.titleEdgeInsets = UIEdgeInsetsMake(-10, 60, 0, 0);
            [dropdownbutton setTitle:@"Twitter" forState:UIControlStateNormal];
            [dropdownbutton setTitleColor:[UIColor whiteColor ]forState: UIControlStateNormal];
            [dropdownbutton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0]];
            [dropdownbutton addTarget:self action:@selector(twitterController) forControlEvents:UIControlEventTouchUpInside];
            [customView addSubview:dropdownbutton];
            return customView;
        }
    
        if(section == 3)
        {
            UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 20)];
            UIImageView *imageView1=[[UIImageView alloc]init];
            UIButton *dropdownbutton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            dropdownbutton.frame=CGRectMake(0, 10, tableView.bounds.size.width, 40);
            imageView1.image=[UIImage imageNamed:@"us-acercade.png"];
            imageView1.frame=CGRectMake(15, 0, 30, 30);
            dropdownbutton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [dropdownbutton addSubview:imageView1];
            dropdownbutton.titleEdgeInsets = UIEdgeInsetsMake(-10, 60, 0, 0);
            [dropdownbutton setTitle:@"Perros en Adopción" forState:UIControlStateNormal];
            [dropdownbutton setTitleColor:[UIColor whiteColor ]forState: UIControlStateNormal];
            [dropdownbutton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0]];
            [dropdownbutton addTarget:self action:@selector(AdoptionController) forControlEvents:UIControlEventTouchUpInside];
        [customView addSubview:dropdownbutton];
        
        return customView;
    }
    
        return 0;
    
}




- (void) AdoptionController
{
    OceanicanAdoptionTableViewController *adoptionControllerVa = [[OceanicanAdoptionTableViewController alloc] init];
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    self.menuContainerViewController.panMode = MFSideMenuPanModeNone;
    [navigationController setNavigationBarHidden:NO animated:NO];
    adoptionControllerVa.dogsArray = self.elementsMenu2;
    [navigationController pushViewController:adoptionControllerVa animated:NO];
}


- (void) facebookController
{
    OceanicanFacebookViewController *adoptionControllerVa = [[OceanicanFacebookViewController alloc] init];
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    self.menuContainerViewController.panMode = MFSideMenuPanModeNone;
    [navigationController setNavigationBarHidden:NO animated:NO];
    [navigationController pushViewController:adoptionControllerVa animated:NO];
}


- (void) twitterController
{
    OceanicanTwitterViewController *adoptionControllerVa = [[OceanicanTwitterViewController alloc] init];
    UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    self.menuContainerViewController.panMode = MFSideMenuPanModeNone;
    [navigationController setNavigationBarHidden:NO animated:NO];
    [navigationController pushViewController:adoptionControllerVa animated:NO];
}

- (void) mainController
{
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed completion:^{}];
    // open the left side menu
    [self.navigationController popToRootViewControllerAnimated:YES];
}




- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
   
    if (section == 0)
        return @"Groups";
    if (section == 1)
        return @"Groups";
    if (section == 2)
        return @"Inbox";
    if (section == 3)
        return @"Acerca de";
    if (section == 4)
        return @"Acerca de";

    return @"undefined";
}





@end




