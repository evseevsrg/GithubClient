//
//  SEGithubManager.m
//  GithubClient
//
//  Created by Evseev Sergey on 04/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SEGithubManager.h"
#import "SEGithubDataItem.h"
#import "Constants.h"
#import "Enums.h"

#import "SERESTClientProtocol.h"


@interface SEGithubManager () {
    
    id <SERESTClientProtocol> _RESTClient;
    NSString *_url;
    
}

@end


@implementation SEGithubManager

- (instancetype)initWithRESTClient:(id <SERESTClientProtocol>)RESTClient andURL:(NSString *)url {
    
    if (self = [super init]) {
        _RESTClient = RESTClient;
        _url = url;
    }
    return self;
}


- (void)getLanguagesInfoByRepo:(NSString *)repo andUser:(NSString *)user withCompletion:(void(^)(NSArray *requests, NSError *error))completion {
    
    NSString *requestURL = [NSString stringWithFormat:@"%@/repos/%@/%@/languages", _url, user, repo];
    
    [_RESTClient getJSONByURL:requestURL withCompletion:^(NSData *response, NSError *error) {
        
        if (error) {
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                completion(nil, [NSError errorWithDomain:kErrorDomain code:RESTErrorDownloading userInfo:[NSDictionary new]]);
            });
            
        } else {
            
            NSArray *json = [self p_parseJSONResults:response];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                if (![json count]) {
                    completion(nil, [NSError errorWithDomain:kErrorDomain code:RESTErrorNoData userInfo:[NSDictionary new]]);
                } else {
                    completion(json, nil);
                }
                
            });
            
        }
        
    }];
    
}

- (void)getListOfRepositoriesByURL:(NSString *)url withCompletion:(void(^)(NSArray *requests, NSError *error))completion {
    
    [_RESTClient getJSONByURL:url withCompletion:^(NSData *response, NSError *error) {
        
        if (error) {
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                completion(nil, [NSError errorWithDomain:kErrorDomain code:RESTErrorDownloading userInfo:[NSDictionary new]]);
            });
            
        } else {
            
            NSArray *json = [self p_parseJSONResults:response];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                if (![json count]) {
                    completion(nil, [NSError errorWithDomain:kErrorDomain code:RESTErrorNoData userInfo:[NSDictionary new]]);
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
                                    @"user": @"google"},
                                  @{@"title": @"Facebook repos",
                                    @"user": @"facebook"},
                                  @{@"title": @"Twitter repos",
                                    @"user": @"twitter"},
                                  @{@"title": @"Microsoft repos",
                                    @"user": @"microsoft"},
                                  @{@"title": @"Yandex repos",
                                    @"user": @"yandex"},
                                  ];
    
    NSMutableArray *requests = [NSMutableArray new];
    
    for(NSDictionary *item in initRequestsData) {
        SEGithubDataItem *githubItem = [[SEGithubDataItem alloc] init];
        githubItem.title = [item objectForKey:@"title"];
        githubItem.user = [item objectForKey:@"user"];
        githubItem.link = [NSString stringWithFormat:@"%@/users/%@/repos", _url, githubItem.user];
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
        if (![[item objectForKey:@"description"] isKindOfClass:[NSNull class]])
            dataItem.subtitle = [item objectForKey:@"description"];
        dataItem.user = [[item objectForKey:@"owner"] objectForKey:@"login"];
        dataItem.repo = [item objectForKey:@"name"];
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
    
    return jsonArray;
    
}


@end
