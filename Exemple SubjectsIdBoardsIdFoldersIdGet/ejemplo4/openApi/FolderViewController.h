//
//  FolderViewController.h
//  subjectsIdBoardsIdFoldersGet
//
//  Created by UOC on 13/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Folder.h"
#import "GTMOAuth2Authentication.h"
#import "Classroom.h"
#import "Board.h"

@interface FolderViewController : UIViewController

@property (nonatomic, strong) Folder *folder;
@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) Classroom *aula;
@property (nonatomic, retain) Board *board;
@property (nonatomic, retain) NSString *idFolder;



@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *unread;
@property (weak, nonatomic) IBOutlet UILabel*total;

@end
