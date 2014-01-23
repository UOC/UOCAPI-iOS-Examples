
//
//  GroupViewController.m
//  ejemplo4
//
//  Created by UOC on 26/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "GroupViewController.h"

@interface GroupViewController ()

@end

@implementation GroupViewController

- (void)loadView
{
    [super loadView];
    
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id grup: %@", self.aula.identifier];
    self.color.text    = [[NSString alloc] initWithFormat:@"color grup: %@", self.aula.color];
    self.titol.text    = [[NSString alloc] initWithFormat:@"títol grup: %@" , self.aula.title];
    self.code.text    = [[NSString alloc] initWithFormat:@"codi grup: %@", self.aula.code];
    self.fatherId.text    = [[NSString alloc] initWithFormat:@"id de l'aula: %@", self.aula.fatherId];
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
