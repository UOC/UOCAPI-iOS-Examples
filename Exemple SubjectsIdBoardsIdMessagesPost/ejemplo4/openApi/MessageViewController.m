//
//  MessageViewController.m
//  subjectsIdBoardsIdMessagesGet
//
//  Created by UOC on 13/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)loadView
{
    [super loadView];
    
    self.identifier.text    = [[NSString alloc] initWithFormat:@"Id: %@", self.message.identifier];
    self.subject.text       = [[NSString alloc] initWithFormat:@"Subject: %@", self.message.subject];
    self.from.text           = [[NSString alloc] initWithFormat:@"From: %@", self.message.from];
    self.to.text            = [[NSString alloc] initWithFormat:@"To: %@", self.message.to];
    self.cc.text            = [[NSString alloc] initWithFormat:@"cc: %@", self.message.cc];
    self.body.text            = self.message.body;
    self.data.text         = self.message.date;
    
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



///////////////
// POST////////
///////////////
/*STARTUOCAPIEXAMPLE*/
// Aquesta es l'accio assignada al boto de reply
-(IBAction)replyMessage
{
    /* UOCAPICALL /api/v1/subjects/{domain_id}/boards/{id}/messages POST*/
    // posem el valor de la data actual.
    NSDate *date = [NSDate date];
    // Passem la data actual al format dels missatges i ho guradem en un string
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"EEE MMM d HH:mm:ss 'CEST' yyyy"];
    NSString *dateString = [dateFormat stringFromDate:date];
    
    // Creem un diccionari amb els valors de un message.
    NSDictionary *resposta = @{@"id":@"31234124", @"subject":[[NSString alloc] initWithFormat:@"Re: %@", self.message.subject], @"snippet":@"", @"date":dateString, @"color":@0, @"status":@0, @"from":self.message.to, @"to":self.message.from, @"cc":self.message.cc, @"body":@"Lorem ipsum ..."};
    // Passem el diccionari a JSON.
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:resposta options:NSJSONWritingPrettyPrinted error:nil];
    // Definim la URL per enviar el missatge.
    NSURL *resourcesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/subjects/%@/boards/%@/messages?access_token=%@", self.aula.identifier,self.board.identifier,self.auth.accessToken]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:resourcesURL];
    
    // Indiquem que el metode a utilitzar sera POST
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    [request setHTTPBody:jsonData];
    
    // Iniciem una conexio asincrona
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init]completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if ([data length] >0 && error == nil)
        {
            NSLog(@"data response - %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            dispatch_async(dispatch_get_main_queue(), ^{
                // Les modificacions visuals nomes es poden realitzar en la cua principal.
                [[[UIAlertView alloc] initWithTitle:@"Enviat" message:@"S'ha enviat el missatge" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
            });
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
