//
//  OceanicanDonateViewController.m
//  oceanican
//
//  Created by Guillermo Guizar on 13/10/14.
//  Copyright (c) 2014 Guillermo Guizar. All rights reserved.
//

#import "OceanicanDonateViewController.h"

@interface OceanicanDonateViewController ()

@end

@implementation OceanicanDonateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Donaciones";

    // Do any additional setup after loading the view from its nib.
    
    [self.donateWebview loadHTMLString:@"<div style='display: table; margin: auto;'> <form action='https://www.paypal.com/cgi-bin/webscr' method='post' target='_top'> <input type='hidden' name='cmd' value='_s-xclick'> <input type='hidden' name='hosted_button_id' value='44A22JR3MBKKG'> <input type='image' src='https://www.paypalobjects.com/es_XC/MX/i/btn/btn_donateCC_LG.gif' border='0' name='submit' alt='PayPal, la forma más segura y rápida de pagar en línea.'> <img alt='' border='0' src='https://www.paypalobjects.com/es_XC/i/scr/pixel.gif' width='1' height='1'> </form> </div>" baseURL:nil];
    
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
