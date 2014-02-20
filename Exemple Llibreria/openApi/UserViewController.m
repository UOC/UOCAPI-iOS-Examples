//
//  MenuViewController.m
//  openApi
//
//  Created by UOC on 16/05/13.
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

    dispatch_queue_t backgroundQueue = dispatch_queue_create("edu.uoc.Llibreria", DISPATCH_QUEUE_SERIAL);
    dispatch_async(backgroundQueue, ^{
        self.user = [[User alloc] getUser:self.auth.accessToken];
        //while (self.user.username == nil) {
            
        //}
        NSLog(@"User: %@", self.user.username);

        dispatch_async(dispatch_get_main_queue(), ^{
            // Actualizamos la vista
            [self mostrarDatosUsuario];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

        });
     
    });
}

/*ENDUOCAPIEXAMPLE*/
- (void)mostrarDatosUsuario
{
    NSLog(@"User: %@", self.user.username);
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
