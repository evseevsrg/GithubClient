//
//  SEGithubManagerProtocol.h
//  GithubClient
//
//  Created by Evseev Sergey on 04/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SEGithubManagerProtocol <NSObject>

- (void)getListOfNoAuthRequests:(void(^)(NSArray *requests, NSError *error))completion;

@end