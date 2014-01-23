//
//  BodyViewController.m
//  subjectsIdBoardsIdFoldersIdMessagesIdBodyGet
//
//  Created by UOC on 14/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "BodyViewController.h"

@interface BodyViewController ()

@end

@implementation BodyViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.body = [[Body alloc] init];
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
    /* UOCAPICALL /api/v1/subjects/{domain_id}/boards/{board_id}/folders/{folder_id}/messages/{id}/body GET*/
    // Definim la URL que ens donara el Body del missatge actual.
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/subjects/%@/boards/%@/folders/%@/messages/%@/body?access_token=%@",self.aula.identifier, self.board.identifier, self.folder.identifier , self.message.identifier , self.auth.accessToken]];
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
        
        [self.body setDatos:messagesDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Les modificacions de la vista nomes es poden fer en la cua principal.
            [self mostraMessage];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
-(void) mostraMessage
{
    self.identifier.text    = [[NSString alloc] initWithFormat:@"Id: %@", self.message.identifier];
    self.bodytext.text            = self.message.body;

}

@end
