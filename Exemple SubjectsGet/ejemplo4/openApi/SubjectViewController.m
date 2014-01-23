//
//  SubjectViewController.m
//  classroomsGet
//
//  Created by UOC on 12/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "SubjectViewController.h"

@interface SubjectViewController ()

@end

@implementation SubjectViewController

- (void)loadView
{
    [super loadView];
    
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id aula: %@", self.aula.identifier];
    self.color.text    = [[NSString alloc] initWithFormat:@"color aula: %@", self.aula.color];
    self.titol.text    = [[NSString alloc] initWithFormat:@"títol aula: %@" , self.aula.title];
    self.code.text    = [[NSString alloc] initWithFormat:@"codi aula: %@", self.aula.code];
    self.fatherId.text    = [[NSString alloc] initWithFormat:@"father id: %@", self.aula.fatherId];
    self.shortTitle.text    = [[NSString alloc] initWithFormat:@"sigles: %@", self.aula.shortTitle];
    self.assignments.text = [[NSString alloc] initWithFormat:@"assignments: %@",self.aula.assignments];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
