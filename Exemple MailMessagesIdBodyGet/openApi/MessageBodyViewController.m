//
//  MessageBodyViewController.m
//  MailMessagesIdBodyGet
//
//  Created by UOC on 19/08/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MessageBodyViewController.h"

@interface MessageBodyViewController ()

@end

@implementation MessageBodyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.messagebody = [[MessageBody alloc] init];
    [self carregaMessage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*STARTUOCAPIEXAMPLE*/
- (void) carregaMessage
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // Definim la URL que ens dona les dades del body del missatge.
    /* UOCAPICALL /api/v1/mail/messages/{id}/body GET*/
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/mail/messages/%@/body?access_token=%@", self.idMessage ,self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
        NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
        NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
        
        if ([messagesDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
            return;
        }
        
        [self.messagebody setDatos:messagesDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Els canvis visuals nomes es poden fer en la cua principal.
            [self mostraMessage];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
-(void) mostraMessage
{
    self.identifier.text    = [[NSString alloc] initWithFormat:@"Id: %@", self.messagebody.identifier];
    self.body.text            = self.messagebody.body;

}
@end
