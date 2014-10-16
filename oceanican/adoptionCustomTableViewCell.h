//
//  adoptionCustomTableViewCell.h
//  oceanican
//
//  Created by Guillermo Guizar on 12/10/14.
//  Copyright (c) 2014 Guillermo Guizar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface adoptionCustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dogName;
@property (weak, nonatomic) IBOutlet UILabel *dogGender;
@property (weak, nonatomic) IBOutlet UILabel *dogAge;
@property (weak, nonatomic) IBOutlet UIImageView *dogPicture;



@end
