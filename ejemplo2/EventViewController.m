//
//  EventViewController.m
//  Ejemplo2
//
//  Created by macoscar on 05/06/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "EventViewController.h"
#import <EventKit/EventKit.h>

@interface EventViewController () {
    
}

@end

@implementation EventViewController

- (void)loadView
{
    [super loadView];
    
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id evento: %@", self.evento.identifier];
    self.summary.text       = self.evento.summary;
    self.url.text           = self.evento.url;
    
    // Definimos el formato de printar la fecha y hora del evento
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd'/'MM'/'yyyy' - 'HH':'mm"];
    
    self.start.text         = [dateFormat stringFromDate:self.evento.start];
    self.end.text           = [dateFormat stringFromDate:self.evento.end];
    
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

- (IBAction)crearEvento
{
    EKEventStore *store = [[EKEventStore alloc] init];
    
    // Pedimos privilegios al dueño para poder trabajar con Calendar
    [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error){
        
        if (!granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Acceso denegado" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
            });
        } else {
            EKEvent *event = [EKEvent eventWithEventStore:store];
            
            //Indicamos que vamos a crear el evento en el calendario predeterminado del dispositivo
            event.calendar = [store defaultCalendarForNewEvents];
            
            // Añadimos los datos del evento en si
            event.title     = self.evento.summary;
            event.startDate = self.evento.start;
            event.endDate   = self.evento.end;
            
            // Registramos el evento (persistencia)
            if([store saveEvent:event span:EKSpanThisEvent commit:YES error:nil] == YES){
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[[UIAlertView alloc] initWithTitle:@"Guardado" message:@"Se ha guardado correctamente el evento en su agenda" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
                });
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Se ha producido un error guardando el evento en el calendario" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
                });
            }
        }
    }];
}
@end
