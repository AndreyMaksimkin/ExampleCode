//
//  UMListInteractorProtocols.h
//  MojoTest
//
//  Created by Андрей on 09.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UMLIstInteractorInput <NSObject>

- (void)findAnimals;

@end

@protocol UMListInteractorOutput <NSObject>

- (void)foundAnimals:(NSArray*)animals;
- (void)showError:(NSError*)error;

@end
