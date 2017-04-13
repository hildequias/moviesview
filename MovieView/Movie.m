//
//  Movie.m
//  MovieView
//
//  Created by Hildequias Junior on 4/13/17.
//  Copyright © 2017 Pixonsoft. All rights reserved.
//

#import "Movie.h"

#define POSTER_PATH         @"poster_path"
#define ADULT               @"adult"
#define OVERVIEW            @"overview"
#define RELEASE_DATE        @"release_date"
#define GENRE_IDS           @"genre_ids"
#define ID                  @"id"
#define ORIGINAL_TITLE      @"original_title"
#define ORIGINAL_LANGUAGE   @"original_language"
#define TITLE               @"title"
#define BACKDROP_PATH       @"backdrop_path"
#define POPULARITY          @"popularity"
#define VOTE_COUNT          @"vote_count"
#define VIDEO               @"video"
#define VOTE_AVERAGE        @"vote_average"

@implementation Movie

- (id)initWithDictionary:(NSDictionary *) obj {
    self = [super init];
    if (self) {
        
        self.posterPath         = [obj valueForKey:POSTER_PATH];
        self.adult              = [obj valueForKey:ADULT];
        self.overview           = [obj valueForKey:OVERVIEW];
        self.releaseDate        = [obj valueForKey:RELEASE_DATE];
        self.genreIds           = [obj valueForKey:GENRE_IDS];
        self._id                = [obj valueForKey:ID];
        self.originalTitle      = [obj valueForKey:ORIGINAL_TITLE];
        self.originalLanguage   = [obj valueForKey:ORIGINAL_LANGUAGE];
        self.title              = [obj valueForKey:TITLE];
        self.backdropPath       = [obj valueForKey:BACKDROP_PATH];
        self.popularity         = [obj valueForKey:POPULARITY];
        self.voteCount          = [obj valueForKey:VOTE_COUNT];
        self.video              = [obj valueForKey:VIDEO];
        self.voteAverage        = [obj valueForKey:VOTE_AVERAGE];
    }
    return self;
}

@end
