//
//  CallViewController.m
//  Exemple Call
//
//  Created by UOC on 03/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "CallViewController.h"

@interface CallViewController ()

@end

@implementation CallViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)openReceptor1
{
    // Aquesta funcio obra la app receptora. La app s'identifica mitjançant el nom
    // que te en el URL Scheme. Tambe se l'hi poden passar parametres.
    // En aquest cas obrirem una app que mostra els tutors de l'usuari.
    // Hi passem l'access token per no tenir que identificar-nos un altre cop.
    NSString *urlString = [NSString stringWithFormat:@"receptor1://tutors?access_token=%@",self.auth.accessToken];
    NSLog(@"%@",self.auth.accessToken);

    
    NSURL *myURL = [NSURL URLWithString:urlString];
    // Comprovem que es pugui obrir l'aplicacio que volem.
    if ([[UIApplication sharedApplication] canOpenURL:myURL] == YES){
        // crear una variable a stdDefaults que contingui el valor de l'adreca que volem accedir
        // per si no tinguessim internet poder tenir la url sense accedir a internet
        [[UIApplication sharedApplication] openURL:myURL];
    }
    else {
        // Obrir la store per baixar la app
    }
}

- (IBAction)openReceptor2
{
    //Aquesta funcio obra l'app que mostra la missatgeria.
    NSString *queryWithoutSpaces = [self.query.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *urlString = [NSString stringWithFormat:@"receptor2://messages?access_token=%@&q=%@",self.auth.accessToken, queryWithoutSpaces];
    NSLog(@"%@",urlString);
    
    
    NSURL *myURL = [NSURL URLWithString:urlString];
    // Comprovem que es pugui obrir l'aplicacio que volem.
    if ([[UIApplication sharedApplication] canOpenURL:myURL] == YES){
        [[UIApplication sharedApplication] openURL:myURL];
    }
    else {
        // Obrir la store per baixar la app  https://itunes.apple.com/app/idAPP
    }
}

@end
