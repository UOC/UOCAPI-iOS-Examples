//
//  PeopleViewController.m
//  Ejemplo1
//
//  Created by UOC on 29/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "PeopleViewController.h"
@interface PeopleViewController ()

@end

@implementation PeopleViewController

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
    self.ident.text = self.people.identifier;
    self.username.text = self.people.username;
    self.name.text = self.people.name;
    self.surname1.text = self.people.surname1;
    self.surname2.text = self.people.surname2;
    self.email.text = self.people.email;
    self.userNumber.text = self.people.userNumber;
    self.hobbies.text = self.people.hobbies;
    self.skills.text = self.people.skills;
    self.about.text = self.people.about;
    self.NGOes.text = self.people.NGOes;
    self.languages.text = self.people.languages;
    self.secondaryEmail.text = self.people.secondaryEmail;
    self.blog.text = self.people.blog;
    self.personalSite.text = self.people.personalSite;
    self.lastUpdate.text =  [[NSString alloc] initWithFormat:@"Last update - %@", self.people.lastUpdate];
}




@end
