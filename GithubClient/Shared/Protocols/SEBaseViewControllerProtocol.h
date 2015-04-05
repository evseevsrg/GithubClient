//
//  SEBaseViewControllerProtocol.h
//  GithubClient
//
//  Created by Evseev Sergey on 04/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SEServiceLocatorProtocol;

@protocol SEBaseViewControllerProtocol <NSObject>

- (void)setupLocator:(id <SEServiceLocatorProtocol>)locator;

@end
