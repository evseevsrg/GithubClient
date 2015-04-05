//
//  SEGithubManager.m
//  GithubClient
//
//  Created by Evseev Sergey on 04/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SEGithubManager.h"
#import "SEGithubDataItem.h"

@implementation SEGithubManager

- (instancetype)init {
    
    if(self = [super init]) {

    }
    return self;
}

- (void)getListOfNoAuthRequests:(void(^)(NSArray *requests, NSError *error))completion {
    
    // return hardcoded dictionary, because there is no request to get list of requests without auth
    
    NSArray *initRequestsData = @[@{@"title": @"Google repos",
                                    @"link": @"https://api.github.com/users/google/repos"},
                                  @{@"title": @"Facebook repos",
                                    @"link": @"https://api.github.com/users/facebook/repos"},
                                  @{@"title": @"Twitter repos",
                                    @"link": @"https://api.github.com/users/twitter/repos"},
                                  @{@"title": @"Microsoft repos",
                                    @"link": @"https://api.github.com/users/microsoft/repos"},
                                  @{@"title": @"Yandex repos",
                                    @"link": @"https://api.github.com/users/yandex/repos"}
                                  ];
    
    NSMutableArray *requests = [NSMutableArray new];
    
    for(NSDictionary *item in initRequestsData) {
        SEGithubDataItem *githubItem = [[SEGithubDataItem alloc] initWithDictionary:item];
        [requests addObject:githubItem];
    }
    
    completion(requests, nil);
    
}


@end
