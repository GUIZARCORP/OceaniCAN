//
//  detailViewController.h
//  oceanican
//
//  Created by Guillermo Guizar on 12/10/14.
//  Copyright (c) 2014 Guillermo Guizar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailViewController : UIViewController

@property (strong, nonatomic) IBOutlet NSMutableDictionary *dogsArray;
@property (strong, nonatomic) IBOutlet NSMutableArray *dogsArrayComplete;
@property (weak, nonatomic) IBOutlet UIImageView *dogImageView;
@property (strong, nonatomic) IBOutlet UILabel *dogName;
@property (strong, nonatomic) IBOutlet UILabel *dogGender;
@property (strong, nonatomic) IBOutlet UILabel *dogInDate;
@property (strong, nonatomic) IBOutlet UILabel *dogColor;
@property (strong, nonatomic) IBOutlet UILabel *dogDescription;
@property (strong, nonatomic) IBOutlet UILabel *dogDespa;

@property (nonatomic) long dogsIndex;



@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


@end
