//
//  Movie.h
//  MovieView
//
//  Created by Hildequias Junior on 4/13/17.
//  Copyright © 2017 Pixonsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic) NSNumber *_id;
@property (nonatomic) NSString *posterPath;
@property (nonatomic) BOOL adult;
@property (nonatomic) NSString *overview;
@property (nonatomic) NSDate *releaseDate;
@property (nonatomic) NSArray *genreIds;
@property (nonatomic) NSString *originalTitle;
@property (nonatomic) NSString *originalLanguage;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *backdropPath;
@property (nonatomic) NSDecimalNumber *popularity;
@property (nonatomic) NSNumber *voteCount;
@property (nonatomic) BOOL video;
@property (nonatomic) NSDecimalNumber *voteAverage;

@end
