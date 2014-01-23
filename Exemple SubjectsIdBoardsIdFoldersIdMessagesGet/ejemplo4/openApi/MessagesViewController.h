//
//  MessagesViewController.h
//  subjectsIdBoardsIdFoldersIdMessagesGet
//
//  Created by UOC on 14/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Board.h"
#import "Classroom.h"
#import "Message.h"
#import "Folder.h"

@interface MessagesViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSMutableArray *messages;
@property (nonatomic, retain) Classroom *aula;
@property (nonatomic, retain) Board *board;
@property (nonatomic, retain) Folder *folder;

- (void)carregarMessages;

-(IBAction)moveMessage;

@end
