//
//  Singleton.m
//  MovieView
//
//  Created by Hildequias Junior on 4/13/17.
//  Copyright © 2017 Pixonsoft. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static Singleton    *instance = nil;

+ (Singleton *)sharedInstance
{
    @synchronized(self)
    {
        if(instance == nil)
            instance = [[super allocWithZone:NULL] init];
    }

    return instance;
}

@end
