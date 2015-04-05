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
    
    NSArray *initRequestsData = @[@{@"title": @"Title1", @"link": @"http://link1"}, @{@"title": @"Title2", @"link": @"http://link2"}, @{@"title": @"Title3", @"link": @"http://link3"}, @{@"title": @"Title4", @"link": @"http://link4"}, @{@"title": @"Title5", @"link": @"http://link5"}];
    
    NSMutableArray *requests = [NSMutableArray new];
    
    for(NSDictionary *item in initRequestsData) {
        SEGithubDataItem *githubItem = [[SEGithubDataItem alloc] initWithDictionary:item];
        [requests addObject:githubItem];
    }
    
    completion(requests, nil);
    
}


@end
