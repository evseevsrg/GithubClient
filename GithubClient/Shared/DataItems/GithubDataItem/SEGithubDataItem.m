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
@synthesize subtitle = _subtitle;
@synthesize user = _user;
@synthesize repo = _repo;
@synthesize link = _link;

- (instancetype)init {
    
    if (self = [super init]) {

    }
    
    return self;
}

@end
