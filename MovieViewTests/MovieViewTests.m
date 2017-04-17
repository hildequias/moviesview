//
//  MovieViewTests.m
//  MovieViewTests
//
//  Created by Hildequias Junior on 4/13/17.
//  Copyright © 2017 Pixonsoft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TheMoviedbService.h"
#import "Singleton.h"

@interface MovieViewTests : XCTestCase

@end

@implementation MovieViewTests {
    TheMoviedbService *service;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    service = [TheMoviedbService new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testAuthenticate {
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [service doAuthentication:^(Authentication *token) {
        
        NSLog(@"%@", token);
        [Singleton sharedInstance].authentication = token;
        XCTAssertNotNil(token, @"Authentication returned nil");
        
        dispatch_semaphore_signal(semaphore);
        
    } onFailure:^(NSString *error) {
        NSLog(@"%@", error);
        XCTAssertNotNil(error, @"Authentication returned nil");
    }];
    
    while(dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:5]];
}

- (void) testGetMoviesPopular {
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSNumber *page = [NSNumber numberWithInt:1];
    
    [service getMovies:page onComplete:^(NSArray<Movie *> *movies) {
        
        NSLog(@"%@", movies);
        XCTAssertNotNil(movies, @"Movies Popular returned nil");
        dispatch_semaphore_signal(semaphore);
        
    } onFailure:^(NSString *error) {
        NSLog(@"%@", error);
        XCTAssertNotNil(error, @"Movies Popular returned nil");
    }];
    
    while(dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:5]];
}

- (void) testGetMovieDetail {
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSNumber *page = [NSNumber numberWithInt:7213];
    
    [service getMovieDetail:page onComplete:^(Movie *movie) {
        
        NSLog(@"%@", movie);
        XCTAssertNotNil(movie, @"Movie Detail returned nil");
        dispatch_semaphore_signal(semaphore);
        
    } onFailure:^(NSString *error) {
        NSLog(@"%@", error);
        XCTAssertNotNil(error, @"Movie Detail returned nil");
    }];
    
    while(dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:5]];
}

@end
