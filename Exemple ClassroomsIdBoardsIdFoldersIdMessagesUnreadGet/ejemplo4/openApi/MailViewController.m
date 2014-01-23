//
//  MailViewController.m
//  Ejemplo4
//
//  Created by UOC on 11/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MailViewController.h"

@interface MailViewController ()

@end

@implementation MailViewController

- (void)loadView
{
    [super loadView];
    
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id evento: %@", self.mail.identifier];
    self.subject.text       = [[NSString alloc] initWithFormat:@"Subject: %@", self.mail.subject];
    self.from.text           = [[NSString alloc] initWithFormat:@"From: %@", self.mail.from];
    self.to.text            = [[NSString alloc] initWithFormat:@"To: %@", self.mail.to];
    self.cc.text            = [[NSString alloc] initWithFormat:@"cc: %@", self.mail.cc];
    self.body.text            = self.mail.body;
    self.data.text         = self.mail.date;
    
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
