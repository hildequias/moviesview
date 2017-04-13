//
//  Singleton.h
//  MovieView
//
//  Created by Hildequias Junior on 4/13/17.
//  Copyright © 2017 Pixonsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Authentication.h"

@interface Singleton : NSObject

#pragma mark - Created a temporary request token that can be used to validate a TMDb user login
#pragma mark -
@property (nonatomic, strong) Authentication *authentication;

+ (Singleton *)sharedInstance;

@end
