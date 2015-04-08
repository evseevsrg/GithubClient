//
//  SEMainViewDataSource.m
//  GithubClient
//
//  Created by Evseev Sergey on 05/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SEMainViewDataSource.h"
#import "SEDataItemProtocol.h"

@interface SEMainViewDataSource () {
    
    id <SEGithubManagerProtocol> _githubManager;
    NSMutableArray *_resources;
    
}

@end


@implementation SEMainViewDataSource

- (instancetype)initWithGithubManager:(id <SEGithubManagerProtocol>)githubManager {
    
    if (self = [super init]) {
        _githubManager = githubManager;
        [self p_initResources];
    }
    return self;
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_resources count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"SEMainViewTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }
    
    id <SEDataItemProtocol> item = [_resources objectAtIndex:indexPath.row];
    
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.link;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.delegate respondsToSelector:@selector(didSelectRowWithData:)]) {
        [self.delegate didSelectRowWithData:[_resources objectAtIndex:indexPath.row]];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - UITableViewDelegate


#pragma mark - private methods

- (void)p_updateTableWithData:(NSArray *)data {
    
    _resources = [NSMutableArray arrayWithArray:data];
    [_tableView reloadData];
    
}

- (void)p_initResources {
    
    [_githubManager getListOfRepos:^(NSArray *requests, NSError *error) {
        
        if (error == nil) {
            [self p_updateTableWithData:requests];
        } else {
            // handle errors
            // no errors, return hardcoded data
        }
        
    }];
    
}

@end
