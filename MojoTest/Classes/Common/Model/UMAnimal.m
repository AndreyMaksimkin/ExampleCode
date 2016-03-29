//
//  UMAnimal.m
//  MojoTest
//
//  Created by Андрей on 08.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "UMAnimal.h"

@implementation UMAnimal

+ (instancetype)animalFromDictionary:(NSDictionary*)dictionary
{
    UMAnimal *animal = [[self alloc] init];
    animal.title = dictionary[@"title"];
    animal.url = dictionary[@"url"];
    animal.desc = dictionary[@"desc"];
    animal.imageURL = dictionary[@"image"];

    
    return animal;
}

@end
