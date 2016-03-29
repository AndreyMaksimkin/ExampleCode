//
//  UMAppDelegate.m
//  MojoTest
//
//  Created by Андрей on 25.02.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "UMAppDelegate.h"
#import "UMAppDependencies.h"

@interface UMAppDelegate ()

@property (nonatomic, strong) UMAppDependencies *dependencies;

@end

@implementation UMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UMAppDependencies *dependencies = [[UMAppDependencies alloc] init];
    self.dependencies = dependencies;
    
    [self.dependencies installRootViewControllerIntoWindow:self.window];
    
    return YES;
}


@end
