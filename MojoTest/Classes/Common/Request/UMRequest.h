//
//  UMRequest.h
//  MojoTest
//
//  Created by Андрей on 08.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^UMRequestCompletionBlock)(NSArray *results, NSError *error);

@interface UMRequest : NSObject

- (void)sendRequestForUploadAnimalsCompletionBlock:(UMRequestCompletionBlock)completionBlock;

@end
