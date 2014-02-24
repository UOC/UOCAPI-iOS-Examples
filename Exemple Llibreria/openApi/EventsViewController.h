//
//  EventsViewController.h
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Event.h"
#import "EventList.h"

@interface EventsViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSMutableArray *events;
@property (nonatomic, assign) BOOL isLoad;

- (void)cargarEventos;

- (IBAction)crearEvent;

@end