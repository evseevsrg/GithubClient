//
//  ViewController.m
//  GithubClient
//
//  Created by Evseev Sergey on 04/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SEMainViewController.h"
#import "SEMainViewDataSource.h"


#import "SEServiceLocatorProtocol.h"
#import "SEGithubManagerProtocol.h"

@interface SEMainViewController () {
    
    SEMainViewDataSource *_dataSource;
    __weak IBOutlet UITableView *_tableView;
    
}

@end

@implementation SEMainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self p_initDataSource];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods

- (void)p_initDataSource {
    
    _dataSource = [[SEMainViewDataSource alloc] initWithGithubManager:[_serviceLocator githubManager]];
    _dataSource.tableView = _tableView;
    
    _tableView.dataSource = _dataSource;
    _tableView.delegate = _dataSource;
    
}


@end
