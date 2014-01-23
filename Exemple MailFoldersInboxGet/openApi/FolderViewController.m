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
    

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.folder = [[Folder alloc] init];
    [self carregarFolder];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*STARTUOCAPIEXAMPLE*/
-(void) carregarFolder{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // Definim la URL per obtenir les dades de l'inbox.
    /* UOCAPICALL /api/v1/mail/folders/inbox GET*/
    NSURL *folderURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/mail/folders/inbox?access_token=%@", self.auth.accessToken]];
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *folderData = [NSData dataWithContentsOfURL:folderURL];
        NSLog(@"Data - %@", [[NSString alloc] initWithData:folderData encoding:NSUTF8StringEncoding]);
        NSDictionary *folderDict = [NSJSONSerialization JSONObjectWithData:folderData options:0 error:nil];
        
        if ([folderDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [folderDict valueForKey:@"error"], [folderDict valueForKey:@"error_description"]);
            return;
        }
        
        [self.folder setDatos:folderDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Per modificar la vista cal estar en la cua principal
            [self mostraFolder];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
-(void) mostraFolder{
    
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id folder: %@", self.folder.identifier];
    self.name.text    = [[NSString alloc] initWithFormat:@"nom folder: %@", self.folder.name];
    self.unread.text    = [[NSString alloc] initWithFormat:@"Unread Messages: %@" , self.folder.unread];
    self.total.text    = [[NSString alloc] initWithFormat:@"Total Messages: %@", self.folder.total];
}

@end
