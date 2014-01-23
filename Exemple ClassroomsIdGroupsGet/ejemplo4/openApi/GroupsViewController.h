//
//  GroupsViewController.h
//  ejemplo4
//
//  Created by UOC on 26/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Classroom.h"
#import "GroupViewController.h"

@interface GroupsViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSMutableArray *grups;
@property (nonatomic, retain) Classroom *aula;

- (void)cargarGrups;

@end
