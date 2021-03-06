//
//  MenuViewController.m
//  openApi
//
//  Created by Oscar Iglesias Lopez on 16/05/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "UserViewController.h"


@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    self.user = [[User alloc] init];
    [self cargarUsuario];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarUsuario
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // Definimos la URL de la API que contiene los datos del usuario.
    // Acuerdate de adjuntar en la query de la URI el token!
    /* UOCAPICALL /api/v1/user GET*/
    NSURL *userURL = [NSURL URLWithString:
                      [NSString stringWithFormat:
                       @"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/user?access_token=%@", self.auth.accessToken]];
    
    // Como la consulta a la API puede ser muy lenta, creamos una tarea en segundo plano que se encargue de hacer el request
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    // NSLog(@"Fuera de la tarea");
    
    dispatch_async(backgroundQueue, ^{
        // NSLog(@"Dentro de la tarea");
        
        // Hacemos el fetch de datos
        NSData *userData = [NSData dataWithContentsOfURL:userURL];
        
        NSLog(@"userData - %@",[[NSString alloc]initWithData:userData encoding:NSUTF8StringEncoding]);
        // Los datos que recibimos los parseamos a una estructura mas manejable como por ejemplo NSDictionary
        NSDictionary *userDict = [NSJSONSerialization JSONObjectWithData:userData options:0 error:nil];
        
        if ([userDict valueForKey:@"error"]) {
            NSLog(@"%@: %@",[userDict valueForKey:@"error"],[userDict valueForKey:@"error_description"]);
            return;
        }
        
        // Los datos recibidos los pasamos al modelo
        [self.user setDatos:userDict];
        
        //La vista solo la puede tocar el thread principal
        dispatch_async(dispatch_get_main_queue(), ^{
            // NSLog(@"Volvemos al hilo principal");
            // Actualizamos la vista
            [self mostrarDatosUsuario];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
        
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)mostrarDatosUsuario
{
    // NSLog(@"User: %@", self.user.username);
    self.username.text   = self.user.username;
    self.name.text       = self.user.name;
    self.number.text     = self.user.number;
    self.fullname.text   = self.user.fullname;
    self.email.text      = self.user.email;
    self.imagenUser.image= self.user.photo;
    self.ident.text = self.user.identifier;
    self.sessionId.text = self.user.sessionID;
    self.languages.text = self.user.language;
}


@end
