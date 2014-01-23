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


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // Important inicialitzar la carpeta abans de carregar les coses.
    self.folder = [[Folder alloc] init];
    [self carregarFolder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*STARTUOCAPIEXAMPLE*/
-(void) carregarFolder
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/classrooms/{domain_id}/boards/{board_id}/folders/{id} GET*/
    // Definim la URL amb l'identificador de l'aula, tauler i carpeta que volem visualitzar.
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/classrooms/%@/boards/%@/folders/%@?access_token=%@", self.aula.identifier, self.board.identifier, self.idFolder, self.auth.accessToken]];
    
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
            // Les actualitzacions i modificacions de la vista nomes es poden fer en la cua principal
            [self mostrarFolder];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
-(void) mostrarFolder
{
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id folder: %@", self.folder.identifier];
    self.name.text    = [[NSString alloc] initWithFormat:@"nom folder: %@", self.folder.name];
    self.unread.text    = [[NSString alloc] initWithFormat:@"Unread Messages: %@" , self.folder.unread];
    self.total.text    = [[NSString alloc] initWithFormat:@"Total Messages: %@", self.folder.total];
    
}

@end
