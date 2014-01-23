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
/*STARTUOCAPIEXAMPLE*/
- (void)cargarEventos
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/calendar/events GET*/
    NSURL *eventsURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/calendar/events?access_token=%@", self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *eventsData = [NSData dataWithContentsOfURL:eventsURL];
        NSLog(@"events data - %@",[[NSString alloc] initWithData:eventsData encoding:NSUTF8StringEncoding]);
        NSDictionary *eventsDict = [NSJSONSerialization JSONObjectWithData:eventsData options:0 error:nil];
        
        if ([eventsDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [eventsDict valueForKey:@"error"], [eventsDict valueForKey:@"error_description"]);
            return;
        }
        
        [self setDatos:eventsDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}

- (void)setDatos:(NSDictionary *)dict
{
    [self.events removeAllObjects];
    for (NSDictionary *evento in [dict objectForKey:@"events"]) {
        Event *e = [[Event alloc] init];
        [e setDatos:evento];
        [self.events addObject:e];
    }
}


/**
    ###################################
    ###  AQUESTA FUNCIO FA EL POST  ###
    ###################################
 */
/* UOCAPICALL /api/v1/calendar/events POST*/
- (IBAction)crearEvent
{
    //Per posar la data actual.
    NSDate *date = [NSDate date];
    //Definim el format de data tal com es el de denver.
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    NSString *dateString = [dateFormat stringFromDate:date];
    
    //Ens inventem un nou event i el posem en un diccionari.
    NSDictionary *nouEvent = @{@"id":@"4815162342",@"url":@"www.uoc.edu",@"summary":@"Nou event creat",@"start":dateString,@"end":@"2014-09-24T10:34:24.248+0000"};
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:nouEvent options:NSJSONWritingPrettyPrinted error:nil];
    NSURL *resourcesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/calendar/events?access_token=%@", self.auth.accessToken]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:resourcesURL];
    
    //Indiquem que el tipus d'accio que voldrem fer sera un POST
    [request setHTTPMethod:@"POST"];
    //El format de les dades estara en json.
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:jsonData];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init]completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         
         if ([data length] >0 && error == nil)
         {
             NSLog(@"Creat - %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
             // Recarreguem els events per a veure el nou event a la llista d'events.
             [self cargarEventos];
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
