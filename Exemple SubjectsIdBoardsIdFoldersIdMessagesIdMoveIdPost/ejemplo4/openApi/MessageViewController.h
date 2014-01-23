//
//  MessageViewController.h
//  subjectsIdBoardsIdFoldersIdMessagesGet
//
//  Created by UOC on 14/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
#import "GTMOAuth2Authentication.h"
#import "Board.h"
#import "Folder.h"
#import "Classroom.h"

@interface MessageViewController : UIViewController

@property (nonatomic, strong) Message *message;
@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) Classroom *aula;
@property (nonatomic, retain) Board *board;
@property (nonatomic, retain) Folder *folder;


@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *subject;
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UILabel *data;
@property (weak, nonatomic) IBOutlet UILabel *from;
@property (weak, nonatomic) IBOutlet UILabel *to;
@property (weak, nonatomic) IBOutlet UILabel *cc;


-(IBAction)moveMessage;

@end
