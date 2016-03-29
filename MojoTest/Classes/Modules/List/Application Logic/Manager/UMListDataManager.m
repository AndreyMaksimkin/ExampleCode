//
//  UMDataManager.m
//  MojoTest
//
//  Created by Андрей on 08.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "UMListDataManager.h"
#import "UMRequest.h"
#import "UMAnimal.h"
#import "NSArray+HOM.h"

@implementation UMListDataManager

- (void)animalsCompletionBlock:(void (^)(NSArray *animalsItems, NSError *error))completionBlock
{
    __weak typeof (self) welf = self;
    
    [self.dataSource sendRequestForUploadAnimalsCompletionBlock:^(NSArray *results, NSError *error){

        if (completionBlock){
            
            if (error){
                completionBlock(nil, error);
            }else{
                completionBlock([welf animalsItemsFromDataSource:results], nil);
            }

        }
    }];
    
}

- (NSArray *)animalsItemsFromDataSource:(NSArray*)arraySource
{
    return [arraySource arrayFromObjectsCollectedWithBlock:^id(NSDictionary *dictionary){
        return [UMAnimal animalFromDictionary:dictionary];
    }];
}

@end
