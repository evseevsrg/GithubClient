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


- (void)showAlertWithError:(NSError *)error {
    
    if (!error)
        return ;
    
    NSString *message = [NSString stringWithFormat:@"ErrorCode: %li", (long)error.code];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}

@end
