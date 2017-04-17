//
//  TheMoviedbService.h
//  MovieView
//
//  Created by Hildequias Junior on 4/13/17.
//  Copyright © 2017 Pixonsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpHelper.h"
#import "Authentication.h"
#import "Movie.h"

typedef void(^tokenBlock) (Authentication *token);
typedef void(^moviesBlock) (NSArray<Movie *>* movies);
typedef void(^movieBlock) (Movie *movie);
typedef void(^errorBlock) (NSString *error);

@interface TheMoviedbService : HttpHelper

-(void) doAuthentication:(tokenBlock) onComplete onFailure:(errorBlock) onFailure;
-(void) getMovies:(NSNumber *)page  onComplete:(moviesBlock) onComplete onFailure:(errorBlock) onFailure;
-(void) getMovieDetail:(NSNumber *) _id onComplete:(movieBlock) onComplete onFailure:(errorBlock) onFailure;

@end
