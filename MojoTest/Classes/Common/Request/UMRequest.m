//
//  UMRequest.m
//  MojoTest
//
//  Created by Андрей on 08.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "UMRequest.h"

@implementation UMRequest

- (void)sendRequestForUploadAnimalsCompletionBlock:(UMRequestCompletionBlock)completionBlock
{
    NSURL *URL = [NSURL URLWithString:@"http://umojo.ru/wtf/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if (completionBlock){
                                   
                                   if (error){
                                       completionBlock(nil, error);
                                   }else{
                                       NSError* jError = nil;
                                       NSArray* json = [NSJSONSerialization JSONObjectWithData:data
                                                                                            options:kNilOptions
                                                                                              error:&jError];
                                       
                                       
                                       if (jError){
                                           completionBlock (nil, jError);
                                       }else{
                                           completionBlock (json, nil);
                                       }
                                   }
                                   
                               }
                           }];
}

@end
