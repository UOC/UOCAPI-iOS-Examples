//
//  MessageViewController.m
//  subjectsIdBoardsIdMessagesGet
//
//  Created by UOC on 13/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "MessageViewController.h"
#import "FoldersViewController.h"
@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)loadView
{
    [super loadView];
    
    self.identifier.text    = [[NSString alloc] initWithFormat:@"Id: %@", self.message.identifier];
    self.subject.text       = [[NSString alloc] initWithFormat:@"Subject: %@", self.message.subject];
    self.from.text           = [[NSString alloc] initWithFormat:@"From: %@", self.message.from];
    self.to.text            = [[NSString alloc] initWithFormat:@"To: %@", self.message.to];
    self.cc.text            = [[NSString alloc] initWithFormat:@"cc: %@", self.message.cc];
    self.body.text            = self.message.body;
    self.data.text         = self.message.date;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Aquesta accio esta assignada al boto de organitzar de la barra.
-(IBAction)moveMessage
{
    // Iniciem la vista que ens mostrara les carpetes desti on moure el missatge.
    FoldersViewController *foldersViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"foldersView"];
    foldersViewController.message = self.message;
    foldersViewController.auth = self.auth;
    foldersViewController.aula = self.aula;
    foldersViewController.board = self.board;
    [self.navigationController pushViewController:foldersViewController animated:YES];
}

@end
