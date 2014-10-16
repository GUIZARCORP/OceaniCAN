//
//  OceanicanTwitterViewController.m
//  oceanican
//
//  Created by Guillermo Guizar on 12/10/14.
//  Copyright (c) 2014 Guillermo Guizar. All rights reserved.
//

#import "OceanicanTwitterViewController.h"

@interface OceanicanTwitterViewController ()

@end

@implementation OceanicanTwitterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Twitter";

    
    NSString *urlString = @"https://twitter.com/RefugiOceaniCAN";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if ([data length] > 0 && error == nil) [self.twitterWebview loadRequest:request];
         else if (error != nil)
         {
             
         }
         //NSLog(@"Error: %@", error);
     }];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
