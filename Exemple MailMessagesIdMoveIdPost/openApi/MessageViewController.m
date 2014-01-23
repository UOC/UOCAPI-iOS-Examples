//
//  MessageViewController.m
//  MailMessagesGet
//
//  Created by UOC on 19/08/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MessageViewController.h"
#import "DestinationFoldersViewController.h"

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
    
    [self.body sizeToFit];
    
    self.data.text         = self.message.date;
    
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


// Creem la opcio de moure missatge que interacutua amb un boto a la barra.
-(IBAction)moveMessage
{
    DestinationFoldersViewController *foldersViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"foldersView"];
    foldersViewController.auth = self.auth;
    foldersViewController.message = self.message;
    // NSLog(@"OK");
    [self.navigationController pushViewController:foldersViewController animated:YES];
}


@end
