//
//  UMListPresenter.h
//  MojoTest
//
//  Created by Андрей on 09.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UMListModuleInterface.h"
#import "UMListInteractorProtocols.h"
#import "UMListWireframe.h"

@protocol UMListViewInterface;

@interface UMListPresenter : NSObject <UMListInteractorOutput, UMListModuleInterface>

@property (nonatomic, strong) id<UMLIstInteractorInput> listInteractor;
@property (nonatomic, strong) UMListWireframe * listWireframe;
@property (nonatomic, strong) UIViewController<UMListViewInterface> *userInterface;

@end
