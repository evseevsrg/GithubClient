//
//  SERepoViewController.m
//  GithubClient
//
//  Created by Evseev Sergey on 05/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SERepoViewController.h"
#import "SERepoViewDataSource.h"

#import "SEServiceLocatorProtocol.h"


@interface SERepoViewController () {
    
    SERepoViewDataSource *_dataSource;
    __weak IBOutlet UITableView *_tableView;
    __weak IBOutlet UIView *_loadingView;
    
}

@end


@implementation SERepoViewController


- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self p_initUI];
    [self p_initDataSource];
    
}


#pragma mark - SERepoViewDataSourceProtocol

- (void)didSelectRowWithData:(id<SEDataItemProtocol>)data {
    
}

- (void)startLoadingData {
    
    _loadingView.hidden = NO;
    
}

- (void)stopLoadingData {
    
    _loadingView.hidden = YES;
    
}

#pragma mark - private methods

- (void)p_initUI {
    
    self.title = self.selectedItem.title;
    [self stopLoadingData];
    
}

- (void)p_initDataSource {
    
    _dataSource = [[SERepoViewDataSource alloc] init];
    _dataSource.tableView = _tableView;
    _dataSource.selectedItem = self.selectedItem;
    _dataSource.delegate = self;
    [_dataSource setGithubManager:[self.serviceLocator githubManager]];
    
    _tableView.dataSource = _dataSource;
    _tableView.delegate = _dataSource;
    
}


@end
