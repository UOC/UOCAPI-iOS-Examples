//
//  BoardViewController.m
//  subjectsIdBoardsGet
//
//  Created by UOC on 13/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "BoardViewController.h"

@interface BoardViewController ()

@end

@implementation BoardViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.board  = [[Board alloc]init];
    [self carregaBoard];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*STARTUOCAPIEXAMPLE*/
-(void)carregaBoard
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/subjects/{domain_id}/boards/{id} GET*/
    // Definim la URL que ens donara les dades del tauler amb id idBoard.
    NSURL *boardURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/subjects/%@/boards/%@?access_token=%@", self.aula.identifier, self.idBoard, self.auth.accessToken]];
    NSLog(@"url - %@",[boardURL absoluteString]);
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *boardData = [NSData dataWithContentsOfURL:boardURL ];
        NSLog(@"boardId data %@", [[NSString alloc]initWithData:boardData encoding:NSUTF8StringEncoding]);
        NSDictionary *boardDict = [NSJSONSerialization JSONObjectWithData:boardData options:0 error:nil];
        
        if ([boardDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [boardDict valueForKey:@"error"], [boardDict valueForKey:@"error_description"]);
            return;
        }
        
        [self.board setDatos:boardDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Les modificacions visuals nomes es poden realitzar en la cua principal.
            [self mostraBoard];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void) mostraBoard
{
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id board: %@", self.board.identifier];
    self.subtype.text    = [[NSString alloc] initWithFormat:@"subtipus board: %@", self.board.subtype];
    self.titol.text    = [[NSString alloc] initWithFormat:@"títol board: %@" , self.board.title];
    self.code.text    = [[NSString alloc] initWithFormat:@"codi board: %@", self.board.code];
    self.domainId.text    = [[NSString alloc] initWithFormat:@"id aula: %@", self.board.domainId];
    self.unread.text    = [[NSString alloc] initWithFormat:@"unread Messages: %@", self.board.unreadMessages];
    self.total.text    = [[NSString alloc] initWithFormat:@"total Messages: %@", self.board.totalMessages];
    
}
@end
