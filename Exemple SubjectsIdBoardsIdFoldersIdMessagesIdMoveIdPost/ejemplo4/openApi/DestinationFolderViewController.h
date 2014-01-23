//
//  DestinationFolderViewController.h
//  subjectsIdBoardsIdFoldersIdMessagesIdMoveIdPost
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

@interface DestinationFolderViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) Classroom *aula;
@property (nonatomic, retain) Board *board;
@property (nonatomic, retain) Message *message;
@property (nonatomic, retain) Folder *sourceFolder;

@property (nonatomic, retain) NSMutableArray *folders;

- (void)cargarFolders;

@end
