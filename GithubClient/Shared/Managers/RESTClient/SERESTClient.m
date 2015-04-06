//
//  SERESTClient.m
//  GithubClient
//
//  Created by Evseev Sergey on 06/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SERESTClient.h"

@implementation SERESTClient


- (instancetype)init {
    
    if (self = [super init]) {
    }
    return self;
}

- (void)getJSONByURL:(NSString *)url withCompletion:(void (^)(NSString *, NSError *))completion {
    
    NSLog(@"get");
    
}

@end
