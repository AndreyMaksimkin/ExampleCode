//
//  NSArray+HOM.h
//  MojoTest
//
//  Created by Андрей on 08.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HOM)

- (NSArray *)arrayFromObjectsCollectedWithBlock:(id(^)(id object))block;

@end
