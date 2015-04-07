//
//  SEGithubDataItem.m
//  GithubClient
//
//  Created by Evseev Sergey on 05/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SEGithubDataItem.h"

@interface SEGithubDataItem () {
    
}

@end


@implementation SEGithubDataItem

@synthesize title = _title;
@synthesize link = _link;

- (instancetype)initWithDictionary:(NSDictionary *)data {
    
    if (self = [super init]) {
        _title = [data objectForKey:@"title"];
        _link = [data objectForKey:@"link"];
    }
    
    return self;
}

#pragma mark - SEDataItemProtocol

- (NSString *)getTitle {
    return _title;
}

- (NSString *)getURL {
    return _link;
}

@end
