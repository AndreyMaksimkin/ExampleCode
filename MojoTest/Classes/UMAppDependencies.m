//
//  UMAppDependencies.m
//  MojoTest
//
//  Created by Андрей on 12.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "UMAppDependencies.h"
#import "UMRootWireframe.h"
#import "UMRequest.h"

#import "UMListWireframe.h"
#import "UMListInteractor.h"
#import "UMListPresenter.h"
#import "UMListDataManager.h"

@interface UMAppDependencies ()

@property (nonatomic, strong) UMListWireframe *listWireframe;

@end

@implementation UMAppDependencies

- (instancetype)init
{
    self = [super init];
    if (self){
        [self configureDependencies];
    }
    
    return self;
}

- (void)configureDependencies
{
    UMRequest *dataSource = [[UMRequest alloc] init];
    UMRootWireframe *rootWireframe = [[UMRootWireframe alloc] init];
    
    UMListWireframe *listWireframe = [[UMListWireframe alloc] init];
    UMListPresenter *listPresenter = [[UMListPresenter alloc] init];
    UMListDataManager *listDataManager = [[UMListDataManager alloc] init];
    UMListInteractor *listInteractor = [[UMListInteractor alloc] initWithDataManager:listDataManager];
    
    listInteractor.output = listPresenter;
    
    listPresenter.listInteractor = listInteractor;
    listPresenter.listWireframe = listWireframe;
    
    listWireframe.rootWireframe = rootWireframe;
    listWireframe.listPresenter = listPresenter;
    
    self.listWireframe = listWireframe;
    
    listDataManager.dataSource = dataSource;
    
}

- (void)installRootViewControllerIntoWindow:(UIWindow *)window
{
    [self.listWireframe presentListInterfaceFromWindow:window];
}

@end
