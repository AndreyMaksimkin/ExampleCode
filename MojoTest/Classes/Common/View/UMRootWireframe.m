//
//  UMRootWireframe.m
//  MojoTest
//
//  Created by Андрей on 12.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "UMRootWireframe.h"

@interface UMRootWireframe ()

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation UMRootWireframe

- (void)showRootTabBarController:(UITabBarController *)tabBarController
                        inWindow:(UIWindow *)window
{
    
    UINavigationController *navigationController = [self navigationControllerFromWindow:window];
    self.navigationController = navigationController;
    navigationController.viewControllers = @[tabBarController];
    
    [window setBackgroundColor:[UIColor whiteColor]];
    window.rootViewController = navigationController;
}

- (void)pushViewController:(UIViewController*)viewController
{
    [self.navigationController pushViewController:viewController animated:YES];
}

- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window
{
    UINavigationController *navigationController = (UINavigationController *)[window rootViewController];
    
    return navigationController;
}

@end
