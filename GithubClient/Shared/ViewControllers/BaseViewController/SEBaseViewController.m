//
//  SEBaseViewController.m
//  GithubClient
//
//  Created by Evseev Sergey on 04/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SEBaseViewController.h"

@interface SEBaseViewController () {
    
}

@end


@implementation SEBaseViewController

@synthesize serviceLocator;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    id <SEBaseViewControllerProtocol> destinationViewController = [segue destinationViewController];
    id <SEBaseViewControllerProtocol> sourceViewController = [segue sourceViewController];
    
    destinationViewController.serviceLocator = sourceViewController.serviceLocator;
    
}

@end
