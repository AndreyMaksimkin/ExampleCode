//
//  UMListWireframe.m
//  MojoTest
//
//  Created by Андрей on 12.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "UMListWireframe.h"
#import "UMListPresenter.h"
#import "UMListViewController.h"
#import "UMRootWireframe.h"
#import "UMDetailAnimalViewController.h"
#import "UMAboutMeViewController.h"

static NSString *ListViewControllerIdentifier = @"UMListViewController";
static NSString *TabBarControllerIdentifier = @"UITabBarController";
static NSString *DetailAnimalViewControllerIdentifier = @"UMDetailAnimalViewController";
static NSString *AboutMeViewControllerIdentifier = @"UMAboutMeViewController";

@interface UMListWireframe ()

@end

@implementation UMListWireframe

- (void)presentListInterfaceFromWindow:(UIWindow *)window
{
    UITabBarController *tabBarController = [self tabBarControllerFromStoryboard];
    UMListViewController *listViewController = [self listViewControllerFromStoryboard];
    listViewController.eventHandler = self.listPresenter;
    self.listPresenter.userInterface = listViewController;
    listViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Animals" image:nil tag:0];
    
    //слегка отклонимся от VIPER и просто добавим контроллер обо мне
    UMAboutMeViewController *aboutMeViewController = [self aboutMeViewControllerFromStoryboard];
    aboutMeViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"О программе" image:nil tag:1];
    
    [tabBarController setViewControllers:@[listViewController, aboutMeViewController]];
    [tabBarController setSelectedIndex:0];
    
    [self.rootWireframe showRootTabBarController:tabBarController inWindow:window];
    
}

- (void)showDetailInterfaceForURL:(NSURL*)url
{
    UMDetailAnimalViewController *detailController = [self detailViewControllerFromStoryboard];
    detailController.url = url;
    [self.rootWireframe pushViewController:detailController];
    
}

- (UMListViewController *)listViewControllerFromStoryboard
{
    UIStoryboard *storyboard = [self mainStoryboard];
    UMListViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:ListViewControllerIdentifier];
    
    return viewController;
}

- (UMDetailAnimalViewController *)detailViewControllerFromStoryboard
{
    UIStoryboard *storyboard = [self mainStoryboard];
    UMDetailAnimalViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:DetailAnimalViewControllerIdentifier];
    
    return viewController;
}

- (UMAboutMeViewController*)aboutMeViewControllerFromStoryboard
{
    UIStoryboard *storyboard = [self mainStoryboard];
    UMAboutMeViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:AboutMeViewControllerIdentifier];
    
    return viewController;
}

- (UITabBarController*)tabBarControllerFromStoryboard
{
    UIStoryboard *storyboard = [self mainStoryboard];
    UITabBarController *tabBarController = [storyboard instantiateViewControllerWithIdentifier:TabBarControllerIdentifier];
    
    return tabBarController;
}


- (UIStoryboard *)mainStoryboard
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:[NSBundle mainBundle]];
    
    return storyboard;
}

@end
