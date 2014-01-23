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
    // Definim la URL que ens dona les dades del perfil actual.
    NSURL *profilesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/user/profiles/current?access_token=%@", self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *profilesData = [NSData dataWithContentsOfURL:profilesURL];
        NSLog(@"Current profile - %@", [[NSString alloc]initWithData:profilesData encoding:NSUTF8StringEncoding]);
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


////////////
/// PUT ////
////////////
-(IBAction)putCurrentProfile
{
    /* UOCAPICALL /api/v1/user/profiles/current PUT*/
    //Exemple de PUT mitjancant un diccionari i JSON
    // Creem el diccionari per a guardar les dades.
    NSDictionary *newProfile = @{
                                 @"appId" : @"UOC",
                                 @"app" : @"UOC",
                                 @"id" : @"UOC-GESTIO-1-ca",
                                 @"userSubtypeId" : @"1",
                                 @"userType" : @"Gestió",
                                 @"usertypeId" : @"GESTIO",
                                 @"userSubtype" : @"Gestió",
                                 @"language" : @"ca"
                                 };
    // Passem el diccionari a JSON
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:newProfile options:NSJSONWritingPrettyPrinted error:nil];
    // Definim la URL per a canviar el perfil.
    NSURL *profileURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/user/profiles/current?access_token=%@", self.auth.accessToken]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:profileURL];
    
    // Indiquem que el metode a utilitzar sera PUT
    [request setHTTPMethod:@"PUT"];
    
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    [request setHTTPBody:jsonData];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init]completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if ([data length] >0 && error == nil)
        {
            NSLog(@"Resposta - %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            [self obtenirCurrentProfile];
            
        }
        else if ([data length] == 0 && error == nil)
        {
            NSLog(@"Nothing was downloaded.");
        }
        else if (error != nil){
            NSLog(@"Error = %@", error);
        }
        
    }];
}
/*ENDUOCAPIEXAMPLE*/

@end
