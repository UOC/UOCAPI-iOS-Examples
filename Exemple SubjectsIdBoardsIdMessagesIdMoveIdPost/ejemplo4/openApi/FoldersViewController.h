//
//  FoldersViewController.h
//  subjectsIdBoardsIdMessagesIdMoveIdPost
//
//  Created by UOC on 14/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Folder.h"
#import "Classroom.h"
#import "Board.h"
#import "Message.h"

@interface FoldersViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) Message *message;
@property (nonatomic, retain) Classroom *aula;
@property (nonatomic, retain) Board *board;

@property (nonatomic, retain) NSMutableArray *folders;
@property (nonatomic, assign) BOOL isLoad;

- (void)cargarFolders;

@end
