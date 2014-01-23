//
//  EventsViewController.m
//  Ejemplo2
//
//  Created by macoscar on 29/05/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "EventsViewController.h"
#import "EventViewController.h"

@interface EventsViewController ()

@end

@implementation EventsViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.events = [[NSMutableArray alloc] init];
    [self cargarEventos];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Recuperamos el evento correspondiente al numero de celda
    Event *evento = [self.events objectAtIndex:indexPath.row];
    
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:evento.summary];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventViewController *eventViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"eventView"];
    eventViewController.evento = [self.events objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:eventViewController animated:YES];
}


/**
    ##################################
    ### AQUI ES FA EL GET D'EVENTS ###
    ##################################
 */
/*STARTUOCAPIEXAMPLE*/
- (void)cargarEventos
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    // Creem la url que ens dona acces als events del calendari.
    /* UOCAPICALL /api/v1/calendar/events GET*/
    NSURL *eventsURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/calendar/events?access_token=%@", self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *eventsData = [NSData dataWithContentsOfURL:eventsURL];
        NSDictionary *eventsDict = [NSJSONSerialization JSONObjectWithData:eventsData options:0 error:nil];
        
        if ([eventsDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [eventsDict valueForKey:@"error"], [eventsDict valueForKey:@"error_description"]);
            return;
        }
        
        [self setDatos:eventsDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // La vista nomes es pot modificar en la cua principal
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)setDatos:(NSDictionary *)dict
{
    [self.events removeAllObjects];
    // Llegim els events i els afegim a l'Array que tenim.
    for (NSDictionary *evento in [dict objectForKey:@"events"]) {
        Event *e = [[Event alloc] init];
        [e setDatos:evento];
        [self.events addObject:e];
    }
}


@end
