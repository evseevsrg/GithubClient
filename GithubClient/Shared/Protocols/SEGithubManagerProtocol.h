//
//  SEGithubManagerProtocol.h
//  GithubClient
//
//  Created by Evseev Sergey on 04/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SERESTClientProtocol;

@protocol SEGithubManagerProtocol <NSObject>

- (instancetype)initWithRESTClient:(id <SERESTClientProtocol>)RESTClient andURL:(NSString *)url;
- (void)getListOfRepos:(void(^)(NSArray *requests, NSError *error))completion;
- (void)getListOfRepositoriesByURL:(NSString *)url withCompletion:(void(^)(NSArray *requests, NSError *error))completion;
- (void)getLanguagesInfoByRepo:(NSString *)repo andUser:(NSString *)user withCompletion:(void (^)(NSArray *requests, NSError *error))completion;

@end