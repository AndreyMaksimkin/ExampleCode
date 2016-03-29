//
//  UMListInteractor.h
//  MojoTest
//
//  Created by Андрей on 08.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UMListInteractorProtocols.h"

@class UMListDataManager;

@interface UMListInteractor : NSObject <UMLIstInteractorInput>

@property (nonatomic, weak) id<UMListInteractorOutput> output;

- (instancetype)initWithDataManager:(UMListDataManager*)dataManager;

@end
