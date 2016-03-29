//
//  UMListInteractor.m
//  MojoTest
//
//  Created by Андрей on 08.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "UMListInteractor.h"
#import "UMListDataManager.h"

@interface UMListInteractor ()

@property (nonatomic, strong) UMListDataManager *dataManager;

@end

@implementation UMListInteractor


- (instancetype)initWithDataManager:(UMListDataManager*)dataManager
{
    self = [super init];
    if (self){
        _dataManager = dataManager;
    }
    
    return self;
}

- (void)findAnimals
{
    __weak typeof (self) welf = self;
    [self.dataManager animalsCompletionBlock:^(NSArray *animalsItems, NSError *error){
        if (error){
            [welf.output showError:error];
        }else{
            [welf.output foundAnimals:animalsItems];
        }
 
    }];
}

@end
