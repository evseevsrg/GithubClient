//
//  ViewController.m
//  GithubClient
//
//  Created by Evseev Sergey on 04/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SEMainViewController.h"
#import "SEMainViewDataSource.h"
#import "SERepoViewController.h"
#import "SESegueID.h"

#import "SEServiceLocatorProtocol.h"
#import "SEGithubManagerProtocol.h"


@interface SEMainViewController () {
    
    SEMainViewDataSource *_dataSource;
    __weak IBOutlet UITableView *_tableView;
    id <SEDataItemProtocol> _selectedItem;
    
}

@end

@implementation SEMainViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {

    }
    return self;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self p_initDataSource];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    SERepoViewController *viewController = [segue destinationViewController];
    viewController.selectedItem = _selectedItem;
    
}


#pragma mark - SEMainViewDataSourceProtocol

- (void)didSelectRowWithData:(id <SEDataItemProtocol>)data {
    
    _selectedItem = data;
    [self.navigationController performSegueWithIdentifier:kPresentRepoViewControllerSegue sender:self];
    
}


#pragma mark - private methods

- (void)p_initDataSource {
    
    _dataSource = [[SEMainViewDataSource alloc] initWithGithubManager:[_serviceLocator githubManager]];
    _dataSource.tableView = _tableView;
    _dataSource.delegate = self;
    
    _tableView.dataSource = _dataSource;
    _tableView.delegate = _dataSource;
    
}


@end
