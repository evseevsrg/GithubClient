//
//  SERepoViewDataSource.h
//  GithubClient
//
//  Created by Evseev Sergey on 05/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "SEGithubManagerProtocol.h"
#import "SEGithubDataItem.h"


@protocol SERepoViewDataSourceProtocol <NSObject>

- (void)didSelectRowWithData:(id <SEDataItemProtocol>)data;
- (void)startLoadingData;
- (void)stopLoadingData;

@end


@interface SERepoViewDataSource : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) id <SERepoViewDataSourceProtocol> delegate;
@property (nonatomic, retain) id <SEDataItemProtocol> selectedItem;

- (void)setGithubManager:(id <SEGithubManagerProtocol>)githubManager;

@end
