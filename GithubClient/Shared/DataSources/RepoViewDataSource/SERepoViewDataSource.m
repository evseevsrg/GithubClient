//
//  SERepoViewDataSource.m
//  GithubClient
//
//  Created by Evseev Sergey on 05/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SERepoViewDataSource.h"
#import "SEDataItemProtocol.h"

@interface SERepoViewDataSource () {
    
    id <SEGithubManagerProtocol> _githubManager;
    NSMutableArray *_resources;
    
}

@end


@implementation SERepoViewDataSource

- (instancetype)init {
    
    if (self = [super init]) {
        
    }
    return self;
    
}

- (void)setGithubManager:(id<SEGithubManagerProtocol>)githubManager {
    
    _githubManager = githubManager;
    [self p_initResources];
    
}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_resources count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"SERepoViewTableCell";
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
    
    [self p_startLoadingData];
    
    [_githubManager getListOfRepositoriesByURL:self.selectedItem.link withCompletion:^(NSArray *requests, NSError *error) {
        
        [self p_stopLoadingData];
        if (error == nil) {
            [self p_updateTableWithData:requests];
        } else {
            // handle errors
            NSLog(@"error loading data");
        }
        
    }];
    
}

- (void)p_startLoadingData {
    
    if ([self.delegate respondsToSelector:@selector(startLoadingData)]) {
        [self.delegate startLoadingData];
    }
    
}

- (void)p_stopLoadingData {
    
    if ([self.delegate respondsToSelector:@selector(stopLoadingData)]) {
        [self.delegate stopLoadingData];
    }
    
}

@end
