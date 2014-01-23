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
    self.people = [[People alloc] init];
    [self carregarPeople];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*STARTUOCAPIEXAMPLE*/
- (void)carregarPeople
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/people/{id} GET*/
    // Definim la URL que ens dona les dades de la persona amb identificador.
    NSURL *peopleURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/people/%@?access_token=%@", self.idPeople, self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *peopleData = [NSData dataWithContentsOfURL:peopleURL];
        NSString *sT = [[NSString alloc] initWithData:peopleData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",sT);
        NSDictionary *peoDict = [NSJSONSerialization JSONObjectWithData:peopleData options:0 error:nil];
        
        if ([peoDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [peoDict valueForKey:@"error"], [peoDict valueForKey:@"error_description"]);
            return;
        }
        
        [self.people setDatos:peoDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Els canvis visuals nomes es poden fer en la cua principal.
            [self mostrarDatosUsuario];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
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
