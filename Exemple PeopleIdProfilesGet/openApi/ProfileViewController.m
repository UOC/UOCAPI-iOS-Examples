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
    
	// Do any additional setup after loading the view.
    [self mostrarDatosUsuario];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
