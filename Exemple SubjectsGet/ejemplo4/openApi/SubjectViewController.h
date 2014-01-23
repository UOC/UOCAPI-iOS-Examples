//
//  SubjectViewController.h
//  classroomsGet
//
//  Created by UOC on 12/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Classroom.h"

@interface SubjectViewController : UIViewController

@property (nonatomic, retain) Classroom *aula;

@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *titol;
@property (weak, nonatomic) IBOutlet UILabel *color;
@property (weak, nonatomic) IBOutlet UILabel *fatherId;
@property (weak, nonatomic) IBOutlet UILabel *assignments;
@property (weak, nonatomic) IBOutlet UILabel *code;
@property (weak, nonatomic) IBOutlet UILabel *shortTitle;



@end
