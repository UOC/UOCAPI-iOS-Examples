//
//  FoldersViewController.h
//  Ejemplo2
//
//  Created by UOC on 12/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Folder.h"
#import "Classroom.h"
#import "Board.h"

@interface FoldersViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) Classroom *aula;
@property (nonatomic, retain) Board *board;

@property (nonatomic, retain) NSMutableArray *folders;
@property (nonatomic, assign) BOOL isLoad;

- (void)cargarFolders;

@end
