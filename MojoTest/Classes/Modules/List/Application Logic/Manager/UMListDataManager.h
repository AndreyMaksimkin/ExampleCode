//
//  UMDataManager.h
//  MojoTest
//
//  Created by Андрей on 08.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UMRequest;

typedef void(^UMListDataManagerAnimalsBlock)(NSArray *entries);

@interface UMListDataManager : NSObject

@property (nonatomic, strong) UMRequest *dataSource;

- (void)animalsCompletionBlock:(void (^)(NSArray *animalsItems, NSError *error))completionBlock;

@end
