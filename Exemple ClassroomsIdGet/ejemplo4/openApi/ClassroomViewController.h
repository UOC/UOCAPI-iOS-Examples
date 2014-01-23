//
//  ClassroomViewController.h
//  classroomsGet
//
//  Created by UOC on 08/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Classroom.h"
#import "GTMOAuth2Authentication.h"

@interface ClassroomViewController : UIViewController

@property (nonatomic, strong) Classroom *aula;
@property (nonatomic, retain) NSString *idAula;
@property (nonatomic, retain) GTMOAuth2Authentication *auth;

@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *titol;
@property (weak, nonatomic) IBOutlet UILabel *color;
@property (weak, nonatomic) IBOutlet UILabel *fatherId;
@property (weak, nonatomic) IBOutlet UILabel *assignments;
@property (weak, nonatomic) IBOutlet UILabel *code;
@property (weak, nonatomic) IBOutlet UILabel *shortTitle;


@end
