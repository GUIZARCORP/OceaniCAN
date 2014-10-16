//
//  OceanicanAdoptionTableViewController.m
//  oceanican
//
//  Created by Guillermo Guizar on 12/10/14.
//  Copyright (c) 2014 Guillermo Guizar. All rights reserved.
//

#import "OceanicanAdoptionTableViewController.h"
#import "adoptionCustomTableViewCell.h"
#import "ProgressHUD.h"
#import "SDWebImage/UIImageView+WebCache.h"
#import "detailViewController.h"



@interface OceanicanAdoptionTableViewController ()

@end

@implementation OceanicanAdoptionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Perros en Adopción";

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor = [UIColor blackColor];
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.dogsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"Cell";
    
    
    adoptionCustomTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"customCell"];
    
    if (!cell2) {
        [tableView registerNib:[UINib nibWithNibName:@"AdoptionCustomCell" bundle:nil] forCellReuseIdentifier:@"customCell"];
        cell2 = [tableView dequeueReusableCellWithIdentifier:@"customCell"];
    }
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    
    cell2.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];

    UIView *selectionColor = [[UIView alloc] initWithFrame:cell2.frame];
    selectionColor.backgroundColor = [UIColor colorWithRed:228/255.0 green:58/255.0 blue:85/255.0 alpha:0.7];
    cell2.selectedBackgroundView = selectionColor;
    
    
    if(indexPath.row > 0 && indexPath.row == [self.dogsArray count] -3 && [[ UIScreen mainScreen ] bounds ].size.height > 480.00)
        cell2.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    else
        cell2.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:17.0/255.0 green:65.0/255.0 blue:92.0/255.0 alpha:.5];
    [[cell2 textLabel] setTextColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]];
    
    
    NSDictionary *tempDictionary= [self.dogsArray objectAtIndex:indexPath.row];
    
    cell2.dogName.text = [NSString stringWithFormat:@"%@", [tempDictionary objectForKey:@"nombre"]];
    
    cell2.dogGender.text = [NSString stringWithFormat:@"%@", [tempDictionary objectForKey:@"genero"]];
    
    cell2.dogAge.text = [NSString stringWithFormat:@"%@", [tempDictionary objectForKey:@"edad"]];
    
    
    // Here we use the new provided setImageWithURL: method to load the web image
    [cell2.dogPicture sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [tempDictionary objectForKey:@"foto"]]]
                   placeholderImage:[UIImage imageNamed:@"placeholder.png"]];

    
    
    
    return cell2;
}




-(NSString*) cacheDirectoryName {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *cacheDirectoryName = [documentsDirectory stringByAppendingPathComponent:@"FlickrImages"];
    return cacheDirectoryName;
}







- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableDictionary *tempDictionary= [self.dogsArray objectAtIndex:indexPath.row];
    NSMutableArray *tempDictionary2= self.dogsArray;
    
   

    detailViewController *detailController = [[detailViewController alloc] init];
    detailController.dogsArray = tempDictionary;
    detailController.dogsArrayComplete = tempDictionary2;

    [self.navigationController pushViewController:detailController animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
