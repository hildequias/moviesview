//
//  Authentication.m
//  MovieView
//
//  Created by Hildequias Junior on 4/13/17.
//  Copyright © 2017 Pixonsoft. All rights reserved.
//

#import "Authentication.h"

#define SUCCESS                @"success"
#define EXPIRES_AT             @"expires_at"
#define REQUEST_TOKEN          @"request_token"

@implementation Authentication

- (id)initWithDictionary:(NSDictionary *) obj {
    self = [super init];
    if (self) {
        
        self.success        = [obj valueForKey:SUCCESS];
        self.expiresAt      = [obj valueForKey:EXPIRES_AT];
        self.requestToken   = [obj valueForKey:REQUEST_TOKEN];
    }
    return self;
}

@end
