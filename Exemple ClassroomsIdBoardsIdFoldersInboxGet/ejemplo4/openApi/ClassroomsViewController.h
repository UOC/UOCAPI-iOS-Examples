//
//  ClassroomsViewController.h
//  ejemplo4
//
//  Created by UOC on 16/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Classroom.h"

@interface ClassroomsViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSMutableArray *classrooms;
@property (nonatomic, assign) BOOL isLoad;

- (void)cargarAulas;


@end
