//
//  SEMainViewDataSource.h
//  GithubClient
//
//  Created by Evseev Sergey on 05/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "SEGithubManagerProtocol.h"

@interface SEMainViewDataSource : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

- (instancetype)initWithGithubManager:(id <SEGithubManagerProtocol>)githubManager;

@end
