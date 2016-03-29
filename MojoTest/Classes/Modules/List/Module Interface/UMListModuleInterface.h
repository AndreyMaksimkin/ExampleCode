//
//  UMListModuleInterface.h
//  MojoTest
//
//  Created by Андрей on 12.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UMAnimal;

@protocol UMListModuleInterface <NSObject>

- (void)updateAnimals;
- (void)openAnimalURL:(NSURL*)url;

@end
