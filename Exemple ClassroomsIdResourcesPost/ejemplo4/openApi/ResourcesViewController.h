//
//  ResourcesViewController.h
//  ejemplo4
//
//  Created by UOC on 16/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Resource.h"
#import "Classroom.h"

@interface ResourcesViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSMutableArray *resources;
@property (nonatomic, retain) Classroom *aula;

- (void)cargarRecursos;

@end
