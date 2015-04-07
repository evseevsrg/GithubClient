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
    NSMutableDictionary *_completionBlocks;
    
}

@property (nonatomic, strong) NSURLSession *session;

@end


@implementation SERESTClient


- (instancetype)init {
    
    if (self = [super init]) {
        
        _timeoutInterval = 5.0;
        _completionBlocks = [NSMutableDictionary new];
        [self p_initSession];
        
    }
    return self;
}


- (void)getJSONByURL:(NSString *)url withCompletion:(void (^)(NSData *, NSError *))completion {
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:_timeoutInterval];
    
    NSURLSessionDataTask *task = [self.session dataTaskWithRequest:request];
    [task resume];
    [_completionBlocks setObject:completion forKey:@(task.taskIdentifier)];
    
}


#pragma mark - NSURLSessionDelegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    
    void (^completion)(NSData *responce, NSError *error) = [_completionBlocks objectForKey:@(dataTask.taskIdentifier)];
    
    if (completion) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(data, nil);
        });
    }
    
    [_completionBlocks removeObjectForKey:@(dataTask.taskIdentifier)];

}


- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    
    if (!error)
        return ;

    void (^completion)(NSData *responce, NSError *error) = [_completionBlocks objectForKey:@(task.taskIdentifier)];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        completion(nil, [NSError errorWithDomain:@"me.evseev.githubclient" code:1 userInfo:[NSDictionary new]]);
    });
    
    [_completionBlocks removeObjectForKey:@(task.taskIdentifier)];
    
}


#pragma mark - private methods

- (void)p_initSession {
    
    self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"me.evseev.githubclient"] delegate:self delegateQueue:nil];
    
}

@end
