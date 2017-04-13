//
//  HttpHelper.h
//  Hildequias
//
//  Created by Hildequias Silas dos Santos Junior on 4/13/17.
//  Copyright © 2017 Hildequias. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^GetDataBlock)(NSData *data);
typedef void(^GetDataBlockException)(NSString* reason);

@interface HttpHelper : NSObject

/**
 Hash SHA1 em base64, gerado a partir do body da requisição
 */
@property(nonatomic, retain)NSString* bodySHA1Base64Hash;

- (void) doGet:(NSString *) url withCallback:(GetDataBlock)callback orError:(GetDataBlockException)fail;

- (void) doPost:(NSString *) url data:(NSString *) stringData withCallback:(GetDataBlock)callback orError:(GetDataBlockException)fail;

- (BOOL) hasInternetConnection;

@end
