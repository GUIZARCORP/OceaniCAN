//
//  OceanicanMainViewController.h
//  oceanican
//
//  Created by Guillermo Guizar on 12/10/14.
//  Copyright (c) 2014 Guillermo Guizar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OceanicanMainViewController : UIViewController
{
    
}

@property (nonatomic, strong) NSMutableArray *dogs;
@property (weak, nonatomic) IBOutlet UIImageView *slideCover;

- (IBAction)AboutOceanican:(id)sender;

- (IBAction)donateOceanican:(id)sender;

- (IBAction)contactOceanican:(id)sender;

@end
