//
//  TheMoviedbService.m
//  MovieView
//
//  Created by Hildequias Junior on 4/13/17.
//  Copyright © 2017 Pixonsoft. All rights reserved.
//

#import "TheMoviedbService.h"
#import "API.pch"

@implementation TheMoviedbService

#pragma mark - Metodos de inicio de classe
#pragma mark -
- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void) doAuthentication:(tokenBlock) onComplete onFailure:(errorBlock) onFailure {
    
    [self doGet:AUTHENTICATION_URL withCallback:^(NSData *data) {
        
        if (!data) onFailure(@"");
        
        NSDictionary *json  = (NSDictionary*) data;

        Authentication *aut = [[Authentication alloc] initWithDictionary:json];
        onComplete(aut);
        
    } orError:^(NSString *reason) {
        NSLog(@"JSON: %@", reason);
        onFailure(reason);
    }];
}

-(void) getMovies:(moviesBlock) onComplete onFailure:(errorBlock) onFailure {
    
    [self doGet:[NSString stringWithFormat:@"%@%@", MOVIE_POLULAR_URL, @"1"] withCallback:^(NSData *data) {
        
        if (!data) onFailure(@"");
        NSDictionary *json  = (NSDictionary*) data;
        onComplete(json);
        
    } orError:^(NSString *reason) {
        NSLog(@"JSON: %@", reason);
        onFailure(reason);
    }];
}

@end
