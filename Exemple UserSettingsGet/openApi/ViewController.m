//
//  ViewController.m
//  openApi
//
//  Created by Oscar Iglesias Lopez on 16/05/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "ViewController.h"
#import "SettingsViewController.h"
#import "Constants.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    self.loadedAuth = 0;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    if (self.loadedAuth == 1) {
        SettingsViewController *settsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"settingsView"];
        settsViewController.auth = self.auth;
        [self.navigationController pushViewController:settsViewController animated:YES];
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
