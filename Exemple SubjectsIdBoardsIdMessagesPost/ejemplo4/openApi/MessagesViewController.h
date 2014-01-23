//
//  MessagesViewController.h
//  subjectsIdBoardsIdMessagesGet
//
//  Created by UOC on 13/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Board.h"
#import "Classroom.h"
#import "Message.h"

@interface MessagesViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSMutableArray *messages;
@property (nonatomic, retain) Classroom *aula;
@property (nonatomic, retain) Board *board;

- (void)carregarMessages;

@end
