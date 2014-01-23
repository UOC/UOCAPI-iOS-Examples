//
//  MailViewController.m
//  Ejemplo4
//
//  Created by UOC on 11/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MailViewController.h"

@interface MailViewController ()

@end

@implementation MailViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Iniciem el mail.
    self.mail = [[Mail alloc] init];
    [self carregarMail];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*STARTUOCAPIEXAMPLE*/
- (void) carregarMail
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // Definim la URL que ens dona les dades del mail en questio
    /* UOCAPICALL /api/v1/classrooms/{domain_id}/boards/{board_id}/messages/{id} GET*/
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/classrooms/%@/boards/%@/messages/%@?access_token=%@",self.aula.identifier, self.tauler.identifier, self.idMail , self.auth.accessToken]];
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
        NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
        
        if ([messagesDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
            return;
        }
        
        [self.mail setDatos:messagesDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // La vista nomes es pot actualitzar/modificar en la cua principal.
            // Cridem a mostrar mail que actualitza les dades de la vista.
            [self mostrarMail];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void) mostrarMail
{
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id evento: %@", self.mail.identifier];
    self.subject.text       = [[NSString alloc] initWithFormat:@"Subject: %@", self.mail.subject];
    self.from.text           = [[NSString alloc] initWithFormat:@"From: %@", self.mail.from];
    self.to.text            = [[NSString alloc] initWithFormat:@"To: %@", self.mail.to];
    self.cc.text            = [[NSString alloc] initWithFormat:@"cc: %@", self.mail.cc];
    self.body.text            = self.mail.body;
    self.data.text         = self.mail.date;
}

@end
