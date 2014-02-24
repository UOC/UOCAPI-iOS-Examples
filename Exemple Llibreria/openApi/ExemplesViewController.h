//
//  ExemplesViewController.h
//  Llibreria
//
//  Created by UOC on 24/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"

@interface ExemplesViewController : UIViewController

@property (nonatomic,retain) GTMOAuth2Authentication *auth;

-(IBAction) getUser;

-(IBAction) getMailMessages;

-(IBAction) postCalendarEvents;

@end
