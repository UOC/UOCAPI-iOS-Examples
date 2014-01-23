//
//  SettingsViewController.h
//  Ejemplo1
//
//  Created by UOC on 24/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Setting.h"

@interface SettingsViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSMutableArray *settings;
@property (nonatomic, assign) BOOL isLoad;

@end
