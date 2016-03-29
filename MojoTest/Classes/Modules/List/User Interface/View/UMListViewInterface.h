//
//  UMListViewInterface.h
//  MojoTest
//
//  Created by Андрей on 09.03.16.
//  Copyright © 2016 Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UMListViewInterface <NSObject>

- (void)showNoContentMessage:(NSString*)message;
- (void)reloadEntries:(NSArray*)entries;

@end
