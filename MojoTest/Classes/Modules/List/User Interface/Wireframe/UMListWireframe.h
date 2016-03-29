//
//  UMListWireframe.h
//  MojoTest
//
//  Created by Андрей on 12.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class UMListPresenter;
@class UMRootWireframe;
@class UMAnimal;


@interface UMListWireframe : NSObject

@property (nonatomic, strong) UMListPresenter *listPresenter;
@property (nonatomic, strong) UMRootWireframe *rootWireframe;

- (void)presentListInterfaceFromWindow:(UIWindow *)window;
- (void)showDetailInterfaceForURL:(NSURL*)url;


@end
