//
//  SideMenuViewController.h
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import <UIKit/UIKit.h>




@interface SideMenuViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *elements;
    NSTimer* timer;
}

@property (strong, nonatomic) IBOutlet NSMutableArray *elementsMenu;
@property (strong, nonatomic) IBOutlet NSMutableArray *elementsMenu2;


@property (strong, nonatomic) IBOutlet NSArray *imagesMenu;
@property (strong, nonatomic) IBOutlet NSMutableArray *members;


@property(nonatomic, retain) UITableView *menu_table;

@property (nonatomic) int valid;

@property (nonatomic) int collapsable;

@property (strong, nonatomic) NSString *inboxBadge;



@end

