//
//  MessagesViewController.h
//  MailMessagesGet
//
//  Created by UOC on 19/08/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Message.h"


@interface MessagesViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSMutableArray *messages;
@property (nonatomic, assign) BOOL isLoad;


- (void)cargarMessages;


@end
