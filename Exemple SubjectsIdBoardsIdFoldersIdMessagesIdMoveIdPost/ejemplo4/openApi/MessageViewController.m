//
//  MessageViewController.m
//  subjectsIdBoardsIdFoldersIdMessagesGet
//
//  Created by UOC on 14/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "MessageViewController.h"
#import "DestinationFolderViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self mostraMessage];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) mostraMessage
{
    self.identifier.text    = [[NSString alloc] initWithFormat:@"Id: %@", self.message.identifier];
    self.subject.text       = [[NSString alloc] initWithFormat:@"Subject: %@", self.message.subject];
    self.from.text           = [[NSString alloc] initWithFormat:@"From: %@", self.message.from];
    self.to.text            = [[NSString alloc] initWithFormat:@"To: %@", self.message.to];
    self.cc.text            = [[NSString alloc] initWithFormat:@"cc: %@", self.message.cc];
    self.body.text            = self.message.body;
    self.data.text         = self.message.date;
}


// L'accio de moure el missatge esta assignat al boto de organitzar de la Barra.
-(IBAction)moveMessage
{
    // Iniciem la vista que ens mostrara les carpetes desti.
    DestinationFolderViewController *destView = [self.storyboard instantiateViewControllerWithIdentifier:@"destinationView"];
    destView.auth = self.auth;
    destView.aula = self.aula;
    destView.sourceFolder = self.folder;
    destView.board = self.board;
    destView.message = self.message;
    [self.navigationController pushViewController:destView animated:YES];
}

@end
