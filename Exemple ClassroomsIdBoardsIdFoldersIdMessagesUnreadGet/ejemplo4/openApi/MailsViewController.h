//
//  MailsViewController.h
//  Ejemplo4
//
//  Created by UOC on 11/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import <Foundation/Foundation.h>
#import "Mail.h"
#import "Classroom.h"
#import "Board.h"
#import "Folder.h"

@interface MailsViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSMutableArray *mails;
@property (nonatomic, retain) Classroom *aula;
@property (nonatomic, retain) Board *tauler;
@property (nonatomic, retain) Folder *folder;

- (void)cargarMails;

@end
