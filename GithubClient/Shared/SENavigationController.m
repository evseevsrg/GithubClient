//
//  SENavigationControllerViewController.m
//  GithubClient
//
//  Created by Evseev Sergey on 04/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SENavigationController.h"
#import "SEServiceLocator.h"
#import "SESegueID.h"

#import "SEServiceLocatorProtocol.h"
#import "SEBaseViewControllerProtocol.h"


@interface SENavigationController () {
    
    id <SEServiceLocatorProtocol> _serviceLocator;
    
}

@end

@implementation SENavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self p_initServiceLocator];
    [self p_showMainController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    id <SEBaseViewControllerProtocol> viewController = [segue destinationViewController];
    [viewController setupLocator:_serviceLocator];
    
}


#pragma mark - private methods


- (void)p_showMainController {
    
    [self performSegueWithIdentifier:kPresentMainViewControllerSegue sender:self];
    
}

- (void)p_initServiceLocator {
    
    _serviceLocator = [[SEServiceLocator alloc] init];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
