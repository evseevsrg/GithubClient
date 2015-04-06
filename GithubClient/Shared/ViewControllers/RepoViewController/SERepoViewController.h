//
//  SERepoViewController.h
//  GithubClient
//
//  Created by Evseev Sergey on 05/04/15.
//  Copyright (c) 2015 Sergey Evseev. All rights reserved.
//

#import "SEBaseViewController.h"
#import "SEDataItemProtocol.h"

#import "SERepoViewDataSource.h"

@interface SERepoViewController : SEBaseViewController <SERepoViewDataSourceProtocol>

@property (nonatomic, retain) id <SEDataItemProtocol> selectedItem;

@end
