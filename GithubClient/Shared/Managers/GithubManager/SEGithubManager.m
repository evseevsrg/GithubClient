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
    
    [_RESTClient getJSONByURL:url withCompletion:^(NSData *responce, NSError *error) {
        
        if (error) {
            completion(nil, error);
        } else {
            
            NSArray *json = [self p_parseJSONResults:responce];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                if (![json count]) {
                    completion(nil, [NSError errorWithDomain:@"me.evseev.githubclient" code:2 userInfo:[NSDictionary new]]);
                } else {
                    completion([self p_formatAsDataItems:json], nil);
                }
                
            });
            
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

- (NSArray *)p_formatAsDataItems:(NSArray *)data {
    
    NSMutableArray *dataItems = [NSMutableArray new];
    
    for(NSDictionary *item in data) {
        
        SEGithubDataItem *dataItem = [SEGithubDataItem new];
        dataItem.title = [item objectForKey:@"name"];
        dataItem.link = [item objectForKey:@"clone_url"];
        [dataItems addObject:dataItem];
        
    }
    return dataItems;
}

- (NSArray *)p_parseJSONResults:(NSData *)jsonData {
    
    NSArray *jsonArray = nil;
    NSError *error = nil;
    
    if ([jsonData isKindOfClass:[NSData class]]) {
        jsonArray =  [NSJSONSerialization JSONObjectWithData:jsonData options: NSJSONReadingMutableContainers error:&error];
    }
    
    if (error) {
        
        NSLog(@"%@", [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
        
    }
    
    return jsonArray;
    
}


@end
