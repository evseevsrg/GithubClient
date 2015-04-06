//
//  SEGithubManager.m
//  GithubClient
//
//  Created by Evseev Sergey on 04/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SEGithubManager.h"
#import "SEGithubDataItem.h"
#import "SERESTClientProtocol.h"


@interface SEGithubManager () {
    
    id <SERESTClientProtocol> _RESTClient;
    
}

@end


@implementation SEGithubManager

- (instancetype)initWithRESTClient:(id <SERESTClientProtocol>)RESTClient {
    
    if (self = [super init]) {
        _RESTClient = RESTClient;
    }
    return self;
}


- (void)getListOfRepositoriesByURL:(NSString *)url withCompletion:(void(^)(NSArray *requests, NSError *error))completion {
    
    [_RESTClient getJSONByURL:url withCompletion:^(NSString *responce, NSError *error) {
        
        if (error) {
            completion(nil, error);
        } else {
            completion([self p_parseJSON:responce], nil);
        }
        
    }];
    
}

- (void)getListOfRepos:(void(^)(NSArray *requests, NSError *error))completion {
    
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


#pragma mark - private methods

- (NSArray *)p_parseJSON:(NSString *)string {
    
    return [NSArray new];
    
}


@end
