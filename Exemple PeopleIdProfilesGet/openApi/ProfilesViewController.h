//
//  ProfilesViewController.h
//  Ejemplo1
//
//  Created by UOC on 24/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Profile.h"
#import "People.h"

@interface ProfilesViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSMutableArray *profiles;
@property (nonatomic, strong) People *person;
@property (nonatomic, assign) BOOL isLoad;
@property(strong, nonatomic) NSMutableData *responseData;

@end
