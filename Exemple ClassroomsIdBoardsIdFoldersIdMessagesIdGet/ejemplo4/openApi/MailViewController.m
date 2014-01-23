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
    self.mail = [[Mail alloc]init];
    [self cargarMail];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarMail
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // Definimos la URL de la API que contiene los datos del mail.
    // Acuerdate de adjuntar en la query de la URI el token!
    /* UOCAPICALL /api/v1/classrooms/{domain_id}/boards/{board_id}/folders/{folder_id}/messages/{id} GET*/
    NSURL *userURL = [NSURL URLWithString:
                      [NSString stringWithFormat:
                       @"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/classrooms/%@/boards/%@/folders/%@/messages/%@?access_token=%@", self.aula.identifier,self.board.identifier,self.folder.identifier, self.idMail ,self.auth.accessToken]];
    
    // Como la consulta a la API puede ser muy lenta, creamos una tarea en segundo plano que se encargue de hacer el request
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    //    NSLog(@"Fuera de la tarea");
    
    dispatch_async(backgroundQueue, ^{
        //        NSLog(@"Dentro de la tarea");
        
        // Hacemos el fetch de datos
        NSData *userData = [NSData dataWithContentsOfURL:userURL];
        
        // Los datos que recibimos los parseamos a una estructura mas manejable como por ejemplo NSDictionary
        NSDictionary *userDict = [NSJSONSerialization JSONObjectWithData:userData options:0 error:nil];
        
        if ([userDict valueForKey:@"error"]) {
            NSLog(@"%@: %@",[userDict valueForKey:@"error"],[userDict valueForKey:@"error_description"]);
            return;
        }
        
        // Los datos recibidos los pasamos al modelo
        [self.mail setDatos:userDict];
        
        //La vista solo la puede tocar el thread principal
        dispatch_async(dispatch_get_main_queue(), ^{
            // Actualizamos la vista
            [self mostrarDatosMail];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
        
    });
}
/*ENDUOCAPIEXAMPLE*/

-(void)mostrarDatosMail
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
