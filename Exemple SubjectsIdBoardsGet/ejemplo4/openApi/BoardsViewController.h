//
//  BoardsViewController.h
//  subjectsIdBoardsGet
//
//  Created by UOC on 13/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Board.h"
#import "Classroom.h"

@interface BoardsViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSMutableArray *boards;
@property (nonatomic, retain) Classroom *aula;

- (void)cargarBoards;
@end
