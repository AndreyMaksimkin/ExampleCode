//
//  UMListViewController.h
//  MojoTest
//
//  Created by Андрей on 09.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UMListModuleInterface.h"
#import "UMListViewInterface.h"

@interface UMListViewController : UIViewController <UMListViewInterface>

@property (nonatomic, strong) id<UMListModuleInterface> eventHandler;

@end
