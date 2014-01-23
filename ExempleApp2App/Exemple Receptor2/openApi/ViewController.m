//
//  ViewController.m
//  openApi
//
//  Created by Oscar Iglesias Lopez on 16/05/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "ViewController.h"
#import "MessagesViewController.h"
#import "Constants.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    self.loadedAuth = 0;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Mirem si tenim alguna crida al centre de notificacions.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(segueFromBoards:) name:@"segueListener" object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    if (self.loadedAuth == 1) {
        MessagesViewController *messagesViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"messagesView"];
        messagesViewController.auth = self.auth;
        messagesViewController.isLoad = YES;
        messagesViewController.query = @"";
        [self.navigationController pushViewController:messagesViewController animated:YES];
        self.loadedAuth = 0;
    } else {
        [self signOut];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Aquesta funcio gestiona la notificacio rebuda del centre de notificacions
-(void) segueFromBoards:(NSNotification *)notification
{
    NSDictionary *file = [notification userInfo];

    MessagesViewController *messagesViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"messagesView"];
    // inicialitzem l'autentificacio.
    [self myCustomAuth];
    // En aquest cas ens interesa obtenir el access_token per a no tenir-nos de autentificar un altre cop.
    self.auth.accessToken = [file objectForKey:@"access_token"];
    messagesViewController.auth = self.auth;
    messagesViewController.isLoad = NO;
    if([[file objectForKey:@"q"] length] > 0){
        messagesViewController.query = [NSString stringWithFormat:@"q=%@&",[file objectForKey:@"q"]];
    }
    else {
        messagesViewController.query = @"";
    }
    self.loadedAuth = 1;
    [self.navigationController pushViewController:messagesViewController animated:YES];
}


- (IBAction)acceder:(UIButton *)sender {
    [self signIn];
}

#pragma mark - OAuth stuff
- (void)signOut
{
    [GTMOAuth2ViewControllerTouch removeAuthFromKeychainForName:keychainName];
}

- (void)myCustomAuth
{
    self.auth = [GTMOAuth2Authentication authenticationWithServiceProvider:@"Custom Service"
                                                             tokenURL:[NSURL URLWithString:urlToken]
                                                          redirectURI:urlRedirect
                                                             clientID:idClient
                                                         clientSecret:secretClient];
}

- (void)signIn
{
    [self signOut];
    [self myCustomAuth];
    
    GTMOAuth2ViewControllerTouch *viewController;
    viewController = [[GTMOAuth2ViewControllerTouch alloc]
                      initWithAuthentication:self.auth
                            authorizationURL:[NSURL URLWithString:urlAuth]
                            keychainItemName:keychainName
                                    delegate:self
                            finishedSelector:@selector(viewController:finishedWithAuth:error:)];
    
    [[self navigationController] pushViewController:viewController animated:YES];
}

- (void)viewController:(GTMOAuth2ViewControllerTouch *)vc
      finishedWithAuth:(GTMOAuth2Authentication *) auth
                 error:(NSError *) error
{
    if (error != nil) {
        // Authentication failed (perhaps the user denied access, or closed the window before granting access)
        
        self.loadedAuth = 0;
        
        NSLog(@"Authentication error: %@", error);
        self.labelError.text = @"Error de autenticación";
      /*  NSData *responseData = [[error userInfo] objectForKey:@"data"]; // kGTMHTTPFetcherStatusDataKey
        
        if ([responseData length] > 0) {
            // show the body of the server's authentication failure response
            NSString *str = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding] ;
            NSLog(@"%@", str);
        }
        
        auth = nil; */
    } else {
        // Sign-in succeeded
        //NSLog(@"Sign-in succeeded");
        //NSLog(@"user=%@ \n authorization=%@ \n expiration date=%@", auth.userAgent, auth.accessToken, auth.expirationDate);
        //NSLog(@"Scope = %@", auth.scope);
        self.labelError.text = @"Access Granted";
        self.labelError.textColor = [UIColor greenColor];
        self.loadedAuth = 1;
    }
}
@end
