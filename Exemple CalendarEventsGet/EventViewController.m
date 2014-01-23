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


@end
