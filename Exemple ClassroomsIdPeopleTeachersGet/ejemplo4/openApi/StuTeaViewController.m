//
//  StuTeaViewController.m
//  ejemplo4
//
//  Created by UOC on 26/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "StuTeaViewController.h"

@interface StuTeaViewController ()

@end

@implementation StuTeaViewController

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
    self.username.text   = self.user.username;
    self.name.text       = self.user.name;
    self.number.text     = self.user.number;
    self.fullname.text   = self.user.fullname;
    self.email.text      = self.user.email;
    self.imagenUser.image= self.user.photo;
}
@end
