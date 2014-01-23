//
//  MenuViewController.h
//  openApi
//
//  Created by macoscar on 24/05/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GTMOAuth2Authentication;

@interface MenuViewController : UITableViewController

@property (nonatomic, retain) NSMutableArray *celdas;
@property (nonatomic, retain) GTMOAuth2Authentication *auth;

@end
