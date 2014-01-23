//
//  PeopleListViewController.h
//  Ejemplo1
//
//  Created by UOC on 29/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "People.h"

@interface PeopleListViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSMutableArray *persons;
@property (nonatomic, assign) BOOL isLoad;


@end
