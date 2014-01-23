//
//  FolderViewController.m
//  MailFoldersGet
//
//  Created by UOC on 14/08/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "FolderViewController.h"

@interface FolderViewController ()

@end

@implementation FolderViewController

- (void)loadView
{
    [super loadView];
    
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id folder: %@", self.folder.identifier];
    self.name.text    = [[NSString alloc] initWithFormat:@"nom folder: %@", self.folder.name];
    self.unread.text    = [[NSString alloc] initWithFormat:@"Unread Messages: %@" , self.folder.unread];
    self.total.text    = [[NSString alloc] initWithFormat:@"Total Messages: %@", self.folder.total];
    
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

@end
