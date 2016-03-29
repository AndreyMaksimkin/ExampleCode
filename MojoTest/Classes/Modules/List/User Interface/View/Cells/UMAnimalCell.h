//
//  UMAnimalCell.h
//  MojoTest
//
//  Created by Андрей on 11.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UMAnimalCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lblHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;

@end
