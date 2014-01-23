//
//  BodyViewController.h
//  subjectsIdBoardsIdFoldersIdMessagesIdBodyGet
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
#import "Body.h"

@interface BodyViewController : UIViewController

@property (nonatomic, strong) Body *body;
@property (nonatomic, retain) Message *message;
@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) Classroom *aula;
@property (nonatomic, retain) Board *board;
@property (nonatomic, retain) Folder *folder;

@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UITextView *bodytext;

@end
