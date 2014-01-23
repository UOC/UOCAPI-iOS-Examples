//
//  FolderViewController.m
//  classBoardsFoldersGet
//
//  Created by UOC on 08/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "FolderViewController.h"

@interface FolderViewController ()

@end

@implementation FolderViewController

- (void)loadView
{
    [super loadView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.folder = [[Folder alloc] init];
    [self cargarFolders];




}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*STARTUOCAPIEXAMPLE*/
- (void)cargarFolders
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/classrooms/{domain_id}/boards/{board_id}/folders/inbox GET*/
    // Definim la URL per obtenir les dades de l'Inbox
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/classrooms/%@/boards/%@/folders/inbox?access_token=%@", self.aula.identifier, self.board.identifier, self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
        NSLog(@"%@",[[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
        NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
        
        if ([messagesDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
            return;
        }
        
        [self.folder setDatos:messagesDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // La vista nomes pot ser modificada en la cua principal
            [self mostraFolder];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)mostraFolder
{
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id folder: %@", self.folder.identifier];
    self.name.text    = [[NSString alloc] initWithFormat:@"nom folder: %@", self.folder.name];
    self.unread.text    = [[NSString alloc] initWithFormat:@"Unread Messages: %@" , self.folder.unread];
    self.total.text    = [[NSString alloc] initWithFormat:@"Total Messages: %@", self.folder.total];
}

@end
