//
//  NSArray+HOM.m
//  MojoTest
//
//  Created by Андрей on 08.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "NSArray+HOM.h"

@implementation NSArray (HOM)

- (NSArray *)arrayFromObjectsCollectedWithBlock:(id(^)(id object))block
{
    __block NSMutableArray *collection = [NSMutableArray arrayWithCapacity:[self count]];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [collection addObject:block(obj)];
    }];
    
    return collection;
}

@end
