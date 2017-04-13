//
//  Authentication.h
//  MovieView
//
//  Created by Hildequias Junior on 4/13/17.
//  Copyright © 2017 Pixonsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Authentication : NSObject

@property (nonatomic) BOOL success;
@property (nonatomic) NSDate *expiresAt;
@property (nonatomic) NSString *requestToken;

- (id)initWithDictionary:(NSDictionary *) obj;

@end
