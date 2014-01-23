//
//  FoldersMoveViewController.h
//  classroomsIdBoardsIdFoldersIdMessagesIdMoveIdPost
//
//  Created by UOC on 12/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Folder.h"
#import "Classroom.h"
#import "Board.h"
#import "Mail.h"

@interface FoldersMoveViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) Classroom *aula;
@property (nonatomic, retain) Board *board;
@property (nonatomic, retain) Mail *mail;
@property (nonatomic, retain) Folder *oriFolder;

@property (nonatomic, retain) NSMutableArray *folders;
@property (nonatomic, assign) BOOL isLoad;

- (void)cargarFolders;


@end
