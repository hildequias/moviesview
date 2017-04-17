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

#define BUDGET              @"budget"
#define HOMEPAGE            @"homepage"
#define IMDB_ID             @"imdb_id"
#define PROD_COMPANIES      @"production_companies"
#define PROD_COUNTRIES      @"production_countries"
#define REVENUE             @"revenue"
#define RUNTIME             @"runtime"
#define SPOKEN_LANGUAGE     @"spoken_languages"
#define STATUS              @"status"
#define TAGLINE             @"tagline"

#define PAGE                @"page"
#define TOTAL_PAGES         @"total_pages"
#define RESULTS             @"results"

@implementation Movie

- (id)initWithDetail:(NSDictionary *) obj {
    self = [super init];
    if (self) {
        
        self.posterPath         = [obj valueForKey:POSTER_PATH];
        self.adult              = [obj valueForKey:ADULT];
        self.overview           = [obj valueForKey:OVERVIEW];
        self.releaseDate        = [obj valueForKey:RELEASE_DATE];
        self._id                = [obj valueForKey:ID];
        self.originalTitle      = [obj valueForKey:ORIGINAL_TITLE];
        self.originalLanguage   = [obj valueForKey:ORIGINAL_LANGUAGE];
        self.title              = [obj valueForKey:TITLE];
        self.backdropPath       = [obj valueForKey:BACKDROP_PATH];
        self.popularity         = [obj valueForKey:POPULARITY];
        self.voteCount          = [obj valueForKey:VOTE_COUNT];
        self.video              = [obj valueForKey:VIDEO];
        self.voteAverage        = [obj valueForKey:VOTE_AVERAGE];
        self.budget             = [obj valueForKey:BUDGET];
        self.homepage           = [obj valueForKey:HOMEPAGE];
        self.imdbId             = [obj valueForKey:IMDB_ID];
        self.productionCompanies= [obj valueForKey:PROD_COMPANIES];
        self.productionCountries= [obj valueForKey:PROD_COUNTRIES];
        self.revenue            = [obj valueForKey:REVENUE];
        self.runtime            = [obj valueForKey:RUNTIME];
        self.spokenLanguages    = [obj valueForKey:SPOKEN_LANGUAGE];
        self.status             = [obj valueForKey:STATUS];
        self.tagline            = [obj valueForKey:TAGLINE];
    }
    return self;
}

- (id)initWithListDictionary:(NSDictionary *) obj {
    self = [super init];
    if (self) {
        
        NSArray *results = [obj valueForKey:RESULTS];
        self.movies      = [NSMutableArray new];
        
        for (int i=0; i<[results count]; i++) {
            
            NSDictionary *ob         = results[i];
            Movie *movie             = [Movie new];
            
            movie.posterPath         = [ob valueForKey:POSTER_PATH];
            movie.adult              = [ob valueForKey:ADULT];
            movie.overview           = [ob valueForKey:OVERVIEW];
            movie.releaseDate        = [ob valueForKey:RELEASE_DATE];
            movie.genreIds           = [ob valueForKey:GENRE_IDS];
            movie._id                = [ob valueForKey:ID];
            movie.originalTitle      = [ob valueForKey:ORIGINAL_TITLE];
            movie.originalLanguage   = [ob valueForKey:ORIGINAL_LANGUAGE];
            movie.title              = [ob valueForKey:TITLE];
            movie.backdropPath       = [ob valueForKey:BACKDROP_PATH];
            movie.popularity         = [ob valueForKey:POPULARITY];
            movie.voteCount          = [ob valueForKey:VOTE_COUNT];
            movie.video              = [ob valueForKey:VIDEO];
            movie.voteAverage        = [ob valueForKey:VOTE_AVERAGE];
            
            movie.page               = [obj valueForKey:PAGE];
            movie.totalPages         = [obj valueForKey:TOTAL_PAGES];
            
            [self.movies addObject:movie];
        }
    }
    return self;
}

@end
