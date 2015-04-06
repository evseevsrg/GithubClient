//
//  SERESTClientProtocol.h
//  GithubClient
//
//  Created by Evseev Sergey on 06/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEGithubManagerProtocol.h"

@protocol SERESTClientProtocol <NSObject>

- (void)getJSONByURL:(NSString *)url withCompletion:(void(^)(NSString *responce, NSError *error)) completion;

@end