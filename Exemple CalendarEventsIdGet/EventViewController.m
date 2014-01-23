//
//  EventViewController.m
//  Ejemplo2
//
//  Created by macoscar on 05/06/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "EventViewController.h"

@interface EventViewController () {
    
}

@end

@implementation EventViewController


/**
  AQUESTA MANERA DE CARREGAR L'EVENT ES INEFICIENT JA QUE LES DADES DELS EVENTS ES PODEN OBTENIR A calendar/events I NO ES
  NECESSARI OBTENIR-LES A /calendar/events/{id}
 */


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.evento = [[Event alloc]init];
    [self carregarEvent];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*STARTUOCAPIEXAMPLE*/
-(void)carregarEvent
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // Definim la url amb el valor identificador de l'event per a obtenir-lo.
    /* UOCAPICALL /api/v1/calendar/events/{id} GET*/
    NSURL *eventsURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/calendar/events/%@?access_token=%@", self.identificadorEvent ,self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *eventsData = [NSData dataWithContentsOfURL:eventsURL];
        NSLog(@"%@",[[NSString alloc] initWithData:eventsData encoding:NSUTF8StringEncoding ]);
        NSDictionary *eventsDict = [NSJSONSerialization JSONObjectWithData:eventsData options:0 error:nil];
        
        if ([eventsDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [eventsDict valueForKey:@"error"], [eventsDict valueForKey:@"error_description"]);
            return;
        }
        
        [self.evento setDatos:eventsDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Els canvis en la vista nomes es poden produir en la cua principal.
            [self mostraEvent];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
    

}
/*ENDUOCAPIEXAMPLE*/

-(void) mostraEvent
{
    self.identifier.text    = self.evento.identifier;
    self.summary.text       = self.evento.summary;
    self.url.text           = self.evento.url;
    
    // Definimos el formato de printar la fecha y hora del evento
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd'/'MM'/'yyyy' - 'HH':'mm"];
    
    self.start.text         = [dateFormat stringFromDate:self.evento.start];
    self.end.text           = [dateFormat stringFromDate:self.evento.end];

}
@end
