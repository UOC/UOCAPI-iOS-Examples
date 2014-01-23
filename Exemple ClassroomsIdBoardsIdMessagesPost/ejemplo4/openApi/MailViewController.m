//
//  MailViewController.m
//  Ejemplo4
//
//  Created by UOC on 11/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MailViewController.h"

@interface MailViewController ()

@end

@implementation MailViewController

- (void)loadView
{
    [super loadView];
    
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id evento: %@", self.mail.identifier];
    self.subject.text       = [[NSString alloc] initWithFormat:@"Subject: %@", self.mail.subject];
    self.from.text           = [[NSString alloc] initWithFormat:@"From: %@", self.mail.from];
    self.to.text            = [[NSString alloc] initWithFormat:@"To: %@", self.mail.to];
    self.cc.text            = [[NSString alloc] initWithFormat:@"cc: %@", self.mail.cc];
    self.body.text            = self.mail.body;
    self.data.text         = self.mail.date;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//////////////////////////
//                      //
//        POST          //
//                      //
//////////////////////////
/*STARTUOCAPIEXAMPLE*/
-(IBAction)postMessage
{
    /* UOCAPICALL /api/v1/classrooms/{domain_id}/boards/{id}/messages POST*/
    // Agafem el valor de la data actual.
    NSDate *date = [NSDate date];
    // Definim el format de data pels mails.
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"EEE MMM d HH:mm:ss 'CEST' yyyy"];
    // Donem a la data actual el format necessari i ho guardem a un String
    NSString *dateString = [dateFormat stringFromDate:date];
    
    
    // Creem un diccionari amb els difenents camps de message i hi posem diferents valors.
    NSDictionary *resposta = @{@"id":@"31234124", @"subject":[[NSString alloc] initWithFormat:@"Re: %@", self.mail.subject], @"snippet":@"", @"date":dateString, @"color":@0, @"status":@0, @"from":self.mail.to, @"to":self.mail.from, @"cc":self.mail.cc, @"body":@"Lorem ipsum ..."};
    // Passem el diccionari a JSON
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:resposta options:NSJSONWritingPrettyPrinted error:nil];
    // Afegim a la URL del missatge el access_token que hem rebut de la vista anterior
    NSURL *resourcesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@?access_token=%@", self.mainURL,self.auth.accessToken]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:resourcesURL];
    
    // Indiquem que el metode que volem utilitzar es un POST
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];

    [request setHTTPBody:jsonData];

    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init]completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if ([data length] >0 && error == nil)
        {
            NSLog(@"data response - %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            dispatch_async(dispatch_get_main_queue(), ^{
                // Com volem modificar la vista hem d'estar a la cua principal
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
