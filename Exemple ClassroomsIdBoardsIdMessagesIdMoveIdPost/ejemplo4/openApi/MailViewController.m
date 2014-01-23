//
//  MailViewController.m
//  Ejemplo4
//
//  Created by UOC on 11/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MailViewController.h"
#import "FoldersViewController.h"

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


// Definim l'accio per obrir la vista permet moure el missatge.
-(IBAction)postMessage
{
    // Iniciem la vista de les carpetes desti on moure el missatge.
    FoldersViewController *foldersViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"foldersView"];
    foldersViewController.aula = self.aula;
    foldersViewController.board = self.board;
    foldersViewController.auth = self.auth;
    foldersViewController.mail = self.mail;
    // NSLog(@"OK");
    [self.navigationController pushViewController:foldersViewController animated:YES];
}

@end
