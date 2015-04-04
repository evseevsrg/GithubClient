//
//  SEServiceLocator.m
//  GithubClient
//
//  Created by Evseev Sergey on 04/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SEServiceLocator.h"
#import "SEGithubManager.h"


@interface SEServiceLocator () {
    
    id <SEGithubManagerProtocol> _githubManager;
    
}

@end

@implementation SEServiceLocator

- (id <SEGithubManagerProtocol>)githubManager {
    
    if (_githubManager == nil) {
        _githubManager = [[SEGithubManager alloc] init];
    }
    
    return _githubManager;
    
    
}

@end
