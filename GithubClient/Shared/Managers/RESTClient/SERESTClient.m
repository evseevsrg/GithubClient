//
//  SERESTClient.m
//  GithubClient
//
//  Created by Evseev Sergey on 06/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SERESTClient.h"

@interface SERESTClient () <NSURLSessionDataDelegate> {
    
    NSTimeInterval _timeoutInterval;
    
}

@property (nonatomic, strong) NSURLSession *session;

@end


@implementation SERESTClient


- (instancetype)init {
    
    if (self = [super init]) {
        
        _timeoutInterval = 15.0;
        [self p_initSession];
        
    }
    return self;
}


- (void)getJSONByURL:(NSString *)url withCompletion:(void (^)(NSData *, NSError *))completion {

    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:_timeoutInterval];
    
    [[self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        completion(data, error);
        
    }] resume];
    
}


#pragma mark - private methods

- (void)p_initSession {
    
    self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
}

@end
