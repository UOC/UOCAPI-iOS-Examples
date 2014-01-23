//
//  MailViewController.h
//  Ejemplo4
//
//  Created by UOC on 11/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MailBody.h"
#import "GTMOAuth2Authentication.h"
#import "Classroom.h"
#import "Board.h"
#import "Folder.h"

@interface MailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UITextView *body;


@property (nonatomic, strong) MailBody *mail;
@property (nonatomic, retain) NSString *idMail;
@property (nonatomic,retain) Classroom *aula;
@property (nonatomic, retain) Board *board;
@property (nonatomic, retain) Folder *folder;


@property (nonatomic, retain) GTMOAuth2Authentication *auth;

@end
