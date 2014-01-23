//
//  BoardViewController.h
//  subjectsIdBoardsGet
//
//  Created by UOC on 13/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Board.h"
#import "GTMOAuth2Authentication.h"
#import "Classroom.h"

@interface BoardViewController : UIViewController

@property (nonatomic, strong) Board *board;
@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSString *idBoard;
@property (nonatomic, retain) Classroom *aula;

@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *subtype;
@property (weak, nonatomic) IBOutlet UILabel *titol;
@property (weak, nonatomic) IBOutlet UILabel *code;
@property (weak, nonatomic) IBOutlet UILabel *domainId;
@property (weak, nonatomic) IBOutlet UILabel *unread;
@property (weak, nonatomic) IBOutlet UILabel *total;

@end
