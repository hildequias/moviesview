//
//  HttpHelper.m
//  Hildequias
//
//  Created by Hildequias Silas dos Santos Junior on 4/13/17.
//  Copyright © 2017 Hildequias. All rights reserved.
//

#import "HttpHelper.h"
#import "AFNetworkActivityIndicatorManager.h"
#import <AFNetworking/AFNetworking.h>
#import "API.pch"

#include <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>

enum HandleServerErrors
{
    kSegmentSent = 4
};

@implementation HttpHelper

- (void) doGet:(NSString *) url withCallback:(GetDataBlock)callback orError:(GetDataBlockException)fail {
    
    if (![self isInternetReachable]) {
        fail(NSLocalizedString(@"MSG_NO_INTERNET_REACHABLE", nil));
        return;
    }
    
    NSLog(@"REQUISIÇÃO GET : %@",url);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer  = [self serializerResponseBasic];
    manager.requestSerializer   = [self serializerRequestBasic:nil];
    manager.securityPolicy.allowInvalidCertificates = NO;
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        callback(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        NSLog(@"HttpHelper.doGet exception:%li %@", (long)error.code, error.localizedDescription);

        fail([NSString stringWithFormat:@"[%li %@]", (long)error.code, error.localizedDescription]);
    }];
}

- (void) doPost:(NSString *) url data:(NSString *) stringData withCallback:(GetDataBlock)callback orError:(GetDataBlockException)fail
{
    if (![self isInternetReachable]) {
        fail(NSLocalizedString(@"MSG_NO_INTERNET_REACHABLE", nil));
        return;
    }
    
    NSError *jsonError;
    NSData *requestBodyData    = [stringData dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:requestBodyData
                                                                 options:kNilOptions
                                                                   error:&jsonError];
    
    if (jsonError) {
        fail([NSString stringWithFormat:@"HttpHelper.doPost >>> jsonError.localizedDescription: %@",jsonError.localizedDescription]);
        return;
    }
    
    NSLog(@"REQUISIÇÃO POST : %@",url);
    NSLog(@"JSON_REQUEST: %@", jsonResponse);
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer  = [self serializerResponseBasic];
    manager.requestSerializer   = [self serializerRequestBasic:[NSString stringWithFormat:@"%@", jsonResponse]];
    manager.securityPolicy.allowInvalidCertificates = TRUE;
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [manager POST:url parameters:jsonResponse progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        callback(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        fail([NSString stringWithFormat:@"%@ [%li %@]", NSLocalizedString(@"MSG_ERROR_UNDERFINED", nil), (long)error.code, error.localizedDescription]);
        
    }];
}

- (AFHTTPResponseSerializer *)serializerResponseBasic {
    
    AFHTTPResponseSerializer *responseSerializer =
    [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    return responseSerializer;
}

- (AFHTTPRequestSerializer *)serializerRequestBasic:(NSString*)data {
    
    AFHTTPRequestSerializer *requestSerializer =
    [AFJSONRequestSerializer serializerWithWritingOptions:NSJSONWritingPrettyPrinted];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"accept"];
    [requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    requestSerializer.allowsCellularAccess = YES;
    requestSerializer.cachePolicy = NSURLRequestReloadIgnoringCacheData;
    requestSerializer.timeoutInterval = 30;
    
    return requestSerializer;
}

-(BOOL) isInternetReachable
{
    SCNetworkReachabilityFlags flags;
    SCNetworkReachabilityRef address;
    address = SCNetworkReachabilityCreateWithName(NULL, "www.apple.com" );
    Boolean success = SCNetworkReachabilityGetFlags(address, &flags);
    CFRelease(address);
    
    bool canReach = success
    && !(flags & kSCNetworkReachabilityFlagsConnectionRequired)
    && (flags & kSCNetworkReachabilityFlagsReachable);
    
    return canReach;
}

-(BOOL)hasInternetConnection
{
    return [self isInternetReachable];
}

-(NSString*)getRequestBodySHA1Hash:(NSString*)plainText
{
    NSString *key = @"YOUR_KEY";
    const char *cKey  = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [plainText cStringUsingEncoding:NSUTF8StringEncoding];
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSData *HMACData = [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
    const unsigned char *buffer = (const unsigned char *)[HMACData bytes];
    NSString *HMAC = [NSMutableString stringWithCapacity:HMACData.length * 2];
    for (int i = 0; i < HMACData.length; ++i){
        HMAC = [HMAC stringByAppendingFormat:@"%02lx", (unsigned long)buffer[i]];
    }
    
    return HMAC;
}

-(NSString*)getBase64FromString:(NSString*)text
{
    // Create NSData object
    NSData *dataTake = [text dataUsingEncoding:NSUTF8StringEncoding];
    
    // Convert to Base64 data
    NSData *base64Data = [dataTake base64EncodedDataWithOptions:0];
    NSLog(@"%@", [NSString stringWithUTF8String:[base64Data bytes]]);
    
    NSString* base64Encode = [NSString stringWithUTF8String:[base64Data bytes]];
    
    return base64Encode;
}

@end
