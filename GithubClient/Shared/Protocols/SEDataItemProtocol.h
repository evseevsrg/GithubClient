//
//  SEDataItemProtocol.h
//  GithubClient
//
//  Created by Evseev Sergey on 05/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SEDataItemProtocol <NSObject>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *link;

@end
