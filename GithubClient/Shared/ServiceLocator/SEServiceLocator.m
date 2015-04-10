//
//  SEServiceLocator.m
//  GithubClient
//
//  Created by Evseev Sergey on 04/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SEServiceLocator.h"
#import "SEGithubManager.h"
#import "SERESTClient.h"

#import "SERESTClientProtocol.h"


@interface SEServiceLocator () {
    
    id <SEGithubManagerProtocol> _githubManager;
    id <SERESTClientProtocol> _RESTClient;
    
}

@end

@implementation SEServiceLocator


- (instancetype)init {
    
    if (self = [super init]) {
        
        _RESTClient = [[SERESTClient alloc] init];
        
    }
    
    return self;
}

- (id <SEGithubManagerProtocol>)githubManager {
    
    if (_githubManager == nil) {
        _githubManager = [[SEGithubManager alloc] initWithRESTClient:_RESTClient andURL:@"https://api.github.com"];
    }
    
    return _githubManager;
    
    
}

@end
