//
//  UMRootWireframe.h
//  MojoTest
//
//  Created by Андрей on 12.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UMRootWireframe : NSObject

- (void)showRootTabBarController:(UITabBarController *)tabBarController
                      inWindow:(UIWindow *)window;

- (void)pushViewController:(UIViewController*)viewController;

@end
