//
//  SEGithubManager.m
//  GithubClient
//
//  Created by Evseev Sergey on 04/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SEGithubManager.h"

@implementation SEGithubManager

- (instancetype)init {
    
    if(self = [super init]) {

    }
    return self;
}

- (void)getListOfNoAuthRequests:(void(^)(NSDictionary *requests, NSError *error))completion {
    
    // return hardcoded dictionary, because there is no request to get list of requests without auth
    
    NSDictionary *requests = @{@"link1": @"url1", @"link2": @"url2", @"link3": @"url3", @"link4": @"url4", @"link5": @"url5"};
    completion(requests, nil);
    
}


@end
