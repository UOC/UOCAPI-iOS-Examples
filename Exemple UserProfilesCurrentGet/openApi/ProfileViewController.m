//
//  ProfileViewController.m
//  Ejemplo1
//
//  Created by UOC on 24/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.profile = [[Profile alloc] init];
	// Do any additional setup after loading the view.
    [self obtenirCurrentProfile];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*STARTUOCAPIEXAMPLE*/
-(void)obtenirCurrentProfile
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/user/profiles/current GET*/
    // Definim la URL que ens donara les dades del perfil actual de l'usuari
    NSURL *profilesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/user/profiles/current?access_token=%@", self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *profilesData = [NSData dataWithContentsOfURL:profilesURL];
        
        NSDictionary *profilesDict = [NSJSONSerialization JSONObjectWithData:profilesData options:0 error:nil];
        
        if ([profilesDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [profilesDict valueForKey:@"error"], [profilesDict valueForKey:@"error_description"]);
            return;
        }
        
        [self.profile setDatos:profilesDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Les modificacions visuals nomes es poden realitzar en la cua principal.
            [self mostrarDatosUsuario];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)mostrarDatosUsuario
{
    //    NSLog(@"User: %@", self.user.username);
    self.appId.text   = self.profile.appId;
    self.app.text   = self.profile.app;
    self.Id.text   = self.profile.ident;
    self.userSubtypeId.text   = self.profile.userSubtypeId;
    self.userType.text   = self.profile.userType;
    self.usertypeId.text   = self.profile.usertypeId;
    self.userSubtype.text   = self.profile.userSubtype;
    self.language.text   = self.profile.language;

}

@end
