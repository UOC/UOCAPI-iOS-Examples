//
//  TutorViewController.m
//  Ejemplo1
//
//  Created by UOC on 24/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "TutorViewController.h"

@interface TutorViewController ()

@end

@implementation TutorViewController

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
    //NSLog(@"User: %@", self.user.username);
    self.username.text   = self.tutor.username;
    self.name.text       = self.tutor.name;
    self.number.text     = self.tutor.number;
    self.fullname.text   = self.tutor.fullname;
    self.email.text      = self.tutor.email;
    self.imagenUser.image= self.tutor.photo;
}
@end
