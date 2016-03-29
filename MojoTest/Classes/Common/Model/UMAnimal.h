//
//  UMAnimal.h
//  MojoTest
//
//  Created by Андрей on 08.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UMAnimal : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *imageURL;

+ (instancetype)animalFromDictionary:(NSDictionary*)dictionary;

@end
