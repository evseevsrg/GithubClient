//
//  ViewController.m
//  GithubClient
//
//  Created by Evseev Sergey on 04/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SEMainViewController.h"
#import "SEServiceLocatorProtocol.h"
#import "SEGithubManagerProtocol.h"

@interface SEMainViewController () {
    
    id <SEGithubManagerProtocol> _githubManager;
    
}

@end

@implementation SEMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _githubManager = [_serviceLocator githubManager];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
