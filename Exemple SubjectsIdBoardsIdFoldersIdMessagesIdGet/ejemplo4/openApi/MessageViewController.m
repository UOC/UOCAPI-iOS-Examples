//
//  MessageViewController.m
//  subjectsIdBoardsIdFoldersIdMessagesGet
//
//  Created by UOC on 14/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.message = [[Message alloc] init];
    [self carregaMessage];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*STARTUOCAPIEXAMPLE*/
-(void) carregaMessage
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/subjects/{domain_id}/boards/{board_id}/folders/{folder_id}/messages/{id} GET*/
    // Definim la URL que ens donara les dades del missatge amb identificador idMes
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/subjects/%@/boards/%@/folders/%@/messages/%@?access_token=%@",self.aula.identifier, self.board.identifier, self.folder.identifier , self.idMes , self.auth.accessToken]];
    // NSLog(@"URL - %@", [messagesURL absoluteString]);
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
        //NSLog(@"message data - %@",[[NSString alloc]initWithData:messagesData encoding:NSUTF8StringEncoding]);
        NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
        
        if ([messagesDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
            return;
        }
        
        [self.message setDatos:messagesDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Les modificacions visuals nomes es poden realitzar en la cua principal.
            [self mostraMessage];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
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
@end
