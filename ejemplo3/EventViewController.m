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

- (IBAction)crearRecordatorio
{
    EKEventStore *store = [[EKEventStore alloc] init];
    
    // Pedimos privilegios al dueño para poder trabajar con Recordatorios
    [store requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error){
        
        if (!granted) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[[UIAlertView alloc] initWithTitle:@"Error"
                                            message:@"Acceso denegado a recordatorios"
                                           delegate:self
                                  cancelButtonTitle:@"Ok"
                                  otherButtonTitles:nil] show];
            });
        } else {
            EKReminder *reminder = [EKReminder reminderWithEventStore:store];
            
            reminder.calendar = [store defaultCalendarForNewReminders];

            reminder.title = self.evento.summary;
            reminder.completed = NO;
            
            // Registramos el recordatorio (persistencia)
            NSError *error;
            if([store saveReminder:reminder commit:YES error:&error]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[[UIAlertView alloc] initWithTitle:@"Guardado"
                                                message:@"Se ha guardado correctamente el recordatorio."
                                               delegate:self
                                      cancelButtonTitle:@"Ok"
                                      otherButtonTitles:nil] show];
                });
            } else {
                NSLog(@"%@", error);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[[UIAlertView alloc] initWithTitle:@"Error"
                                                message:@"Se ha producido un error guardando el recordatorio"
                                               delegate:self
                                      cancelButtonTitle:@"Ok"
                                      otherButtonTitles:nil] show];
                });
            }
        }
    }];
}
@end
