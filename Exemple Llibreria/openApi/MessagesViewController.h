//
//  MessagesViewController.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "HistoryViewController.h"
#import "Message.h"


@interface MessagesViewController : UITableViewController

@property (nonatomic,retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSMutableArray *messages;

- (void)cargarMessages;

@end
