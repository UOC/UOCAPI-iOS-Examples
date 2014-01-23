//
//  SubjectsViewController.h
//  classroomsGet
//
//  Created by UOC on 12/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Classroom.h"

@interface SubjectsViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSMutableArray *classrooms;
@property (nonatomic, assign) BOOL isLoad;

- (void)cargarAulas;



@end
