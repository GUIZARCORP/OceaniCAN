//
//  detailViewController.m
//  oceanican
//
//  Created by Guillermo Guizar on 12/10/14.
//  Copyright (c) 2014 Guillermo Guizar. All rights reserved.
//

#import "detailViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"


@interface detailViewController ()

@end

@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.dogsIndex = 0;
    
    self.scrollView.contentSize =CGSizeMake(320, 700);
    [self.view addSubview:self.scrollView];

    
    self.navigationItem.title = [NSString stringWithFormat:@"%@", [self.dogsArray objectForKey:@"nombre"]];

    
    self.dogName.backgroundColor = [UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:0.35];
    
    UISwipeGestureRecognizer *swipeRecognizerLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDetectedLeft:)];
    swipeRecognizerLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeRecognizerLeft];
    
    UISwipeGestureRecognizer *swipeRecognizerRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDetectedRight:)];
    swipeRecognizerRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRecognizerRight];
    

    [self loadData];
    // Do any additional setup after loading the view from its nib.
}


- (void)swipeDetectedRight:(UIGestureRecognizer *)sender
{
    if (!self.dogsIndex == 0)
    {
        
        [UIView beginAnimations:@"Flip" context:nil];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
        [UIView commitAnimations];
        
        self.dogName.text = [NSString stringWithFormat:@"%@", [[self.dogsArrayComplete objectAtIndex:self.dogsIndex - 1] objectForKey:@"nombre"]];
        
        self.navigationItem.title = [NSString stringWithFormat:@"%@", [[self.dogsArrayComplete objectAtIndex:self.dogsIndex - 1] objectForKey:@"nombre"]];
        
        
        self.dogGender.text = [NSString stringWithFormat:@"%@", [[self.dogsArrayComplete objectAtIndex:self.dogsIndex - 1] objectForKey:@"genero"]];
        
        self.dogColor.text = [NSString stringWithFormat:@"%@", [[self.dogsArrayComplete objectAtIndex:self.dogsIndex - 1] objectForKey:@"color"]];
        
        self.dogDescription.text = [NSString stringWithFormat:@"%@", [[self.dogsArrayComplete objectAtIndex:self.dogsIndex - 1] objectForKey:@"descripcion"]];
        
        
        NSString *despa = [NSString stringWithFormat:@"%@", [[self.dogsArrayComplete objectAtIndex:self.dogsIndex - 1] objectForKey:@"desparacitado"]];
        
        if ([despa integerValue] == 1)
        {
            self.dogDespa.text = @"✔︎";
        }
        else
        {
            self.dogDespa.text = @"✖︎";
        }
        
        
        
        // Here we use the new provided setImageWithURL: method to load the web image
        [self.dogImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [[self.dogsArrayComplete objectAtIndex:self.dogsIndex - 1] objectForKey:@"foto"]]]
                             placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        self.dogsIndex = self.dogsIndex - 1;
        
        
    }
    
}

- (void)swipeDetectedLeft:(UIGestureRecognizer *)sender {
    
    long aux = [self.dogsArrayComplete count] - 1;
    if (self.dogsIndex == aux)
    {
    }
    else
    {
        [UIView beginAnimations:@"Flip" context:nil];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
        [UIView commitAnimations];
        
        self.dogName.text = [NSString stringWithFormat:@"%@", [[self.dogsArrayComplete objectAtIndex:self.dogsIndex + 1] objectForKey:@"nombre"]];
        
        self.navigationItem.title = [NSString stringWithFormat:@"%@", [[self.dogsArrayComplete objectAtIndex:self.dogsIndex + 1] objectForKey:@"nombre"]];
        
        self.dogGender.text = [NSString stringWithFormat:@"%@", [[self.dogsArrayComplete objectAtIndex:self.dogsIndex + 1] objectForKey:@"genero"]];
        
        self.dogColor.text = [NSString stringWithFormat:@"%@", [[self.dogsArrayComplete objectAtIndex:self.dogsIndex + 1] objectForKey:@"color"]];
        
        self.dogDescription.text = [NSString stringWithFormat:@"%@", [[self.dogsArrayComplete objectAtIndex:self.dogsIndex + 1] objectForKey:@"descripcion"]];
        
        
        NSString *despa = [NSString stringWithFormat:@"%@", [[self.dogsArrayComplete objectAtIndex:self.dogsIndex + 1] objectForKey:@"desparacitado"]];
        
        if ([despa integerValue] == 1)
        {
            self.dogDespa.text = @"✔︎";
        }
        else
        {
            self.dogDespa.text = @"✖︎";
        }
        
        
        
        // Here we use the new provided setImageWithURL: method to load the web image
        [self.dogImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [[self.dogsArrayComplete objectAtIndex:self.dogsIndex + 1] objectForKey:@"foto"]]]
                             placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        
        self.dogsIndex = self.dogsIndex + 1;
        
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) loadData
{
    long i = 0;
    
    NSString *code = [NSString stringWithFormat:@"%@", [self.dogsArray objectForKey:@"codigo"]];
    for (i=0; i<= [self.dogsArrayComplete count]; i++)
    {
        if([code isEqualToString: [NSString stringWithFormat:@"%@", [[self.dogsArrayComplete objectAtIndex:i] objectForKey:@"codigo"]]])
        {
            self.dogsIndex = i;
            i = [self.dogsArrayComplete count] +2;
        }
    }
    
    self.dogName.text = [NSString stringWithFormat:@"%@", [self.dogsArray objectForKey:@"nombre"]];
    self.dogGender.text = [NSString stringWithFormat:@"%@, %@", [self.dogsArray objectForKey:@"edad"], [self.dogsArray objectForKey:@"genero"]];
    self.dogColor.text = [NSString stringWithFormat:@"%@", [self.dogsArray objectForKey:@"color"]];
    self.dogDescription.text = [NSString stringWithFormat:@"%@", [self.dogsArray objectForKey:@"descripcion"]];
    
    NSString *despa = [NSString stringWithFormat:@"%@", [self.dogsArray objectForKey:@"desparacitado"]];
    
    if ([despa integerValue] == 1)
    {
        self.dogDespa.text = @"✔︎";
    }
    else
    {
        self.dogDespa.text = @"✖︎";
    }
    
    
    
    // Here we use the new provided setImageWithURL: method to load the web image
    [self.dogImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [self.dogsArray objectForKey:@"foto"]]]
                        placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    
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
