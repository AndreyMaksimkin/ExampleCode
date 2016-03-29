//
//  UMListPresenter.m
//  MojoTest
//
//  Created by Андрей on 09.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import "UMListPresenter.h"
#import "UMListViewInterface.h"

@implementation UMListPresenter


#pragma mark UMListInteractorOutput methods

- (void)updateAnimals
{
    [self.listInteractor findAnimals];
}

- (void)openAnimalURL:(NSURL*)url
{
    [self.listWireframe showDetailInterfaceForURL:url];
}

- (void)foundAnimals:(NSArray*)animals
{
     [self.userInterface reloadEntries:animals];
}

- (void)showError:(NSError *)error
{
    [self.userInterface showNoContentMessage:error.localizedDescription];
}

@end
