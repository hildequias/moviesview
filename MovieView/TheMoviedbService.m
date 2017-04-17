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

-(void) getMovies:(NSNumber *)page  onComplete:(moviesBlock) onComplete onFailure:(errorBlock) onFailure {
    
    [self doGet:[NSString stringWithFormat:@"%@%d", MOVIE_POLULAR_URL, (int)page] withCallback:^(NSData *data) {
        
        if (!data) onFailure(@"");
        NSDictionary *json  = (NSDictionary*) data;
        Movie *movie = [[Movie alloc] initWithListDictionary:json];
        
        onComplete(movie.movies);
        
    } orError:^(NSString *reason) {
        NSLog(@"JSON: %@", reason);
        onFailure(reason);
    }];
}

-(void) getMovieDetail:(NSNumber *) _id onComplete:(movieBlock) onComplete onFailure:(errorBlock) onFailure {
    
    [self doGet:[NSString stringWithFormat:MOVIE_DETAILS, BASE_URL, _id, API_KEY] withCallback:^(NSData *data) {
        
        if (!data) onFailure(@"");
        NSDictionary *json  = (NSDictionary*) data;
        Movie *movie = [[Movie alloc] initWithDetail:json];
        
        onComplete(movie);
        
    } orError:^(NSString *reason) {
        NSLog(@"JSON: %@", reason);
        onFailure(reason);
    }];
}

@end
