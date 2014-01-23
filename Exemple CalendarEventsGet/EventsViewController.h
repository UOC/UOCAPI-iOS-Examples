//
//  EventsViewController.h
//  Ejemplo2
//
//  Created by macoscar on 29/05/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Event.h"

@interface EventsViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSMutableArray *events;
@property (nonatomic, assign) BOOL isLoad;

- (void)cargarEventos;


@end
