//
//  ResourcesViewController.m
//  ejemplo4
//
//  Created by UOC on 16/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "ResourcesViewController.h"
#import "ResourceViewController.h"

@interface ResourcesViewController ()

@end

@implementation ResourcesViewController


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
    
    self.resources = [[NSMutableArray alloc] init];
    [self cargarRecursos];
    
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
    return [self.resources count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Recuperamos el evento correspondiente al numero de celda
    Resource *recurs = [self.resources objectAtIndex:indexPath.row];
    
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:recurs.title];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ResourceViewController *resourceViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"resourceView"];
    resourceViewController.recurs = [self.resources objectAtIndex:indexPath.row];

    [self.navigationController pushViewController:resourceViewController animated:YES];
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarRecursos
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // Definim la URL per obtenir els recursos.
    /* UOCAPICALL /api/v1/classrooms/{id}/resources GET*/
    NSURL *resourcesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/classrooms/%@/resources?access_token=%@", self.aula.identifier, self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *resourcesData = [NSData dataWithContentsOfURL:resourcesURL ];
        NSDictionary *resourcesDict = [NSJSONSerialization JSONObjectWithData:resourcesData options:0 error:nil];
        
        if ([resourcesDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [resourcesDict valueForKey:@"error"], [resourcesDict valueForKey:@"error_description"]);
            return;
        }
        
        [self setDatos:resourcesDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // La vista nomes es pot modificar en la cua principal.
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}

- (void)setDatos:(NSDictionary *)dict
{
    // Eliminem els recursos per evitar duplicats.
    [self.resources removeAllObjects];
    for (NSDictionary *resource in [dict objectForKey:@"resources"]) {
        Resource *r = [[Resource alloc] init];
        [r setDatos:resource];
        [self.resources addObject:r];
    }
}


///////////////////////
///////  POST /////////
///////////////////////
/* UOCAPICALL /api/v1/classrooms/{id}/resources POST*/
- (IBAction)crearRecurs{
    
    //Exemple de POST mitjancant un diccionari i JSON
    // Creem el diccionari per a guardar les dades.
    NSDictionary *recursPost = @{@"id": @"545844", @"type":@"Conversation", @"subtype":@"WKGRP_FO", @"title":@"Fòrum", @"code":@"uoc_demo_011_01_f01", @"domainId":@"308959"};
    // Passem el diccionari a JSON
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:recursPost options:NSJSONWritingPrettyPrinted error:nil];
    NSURL *resourcesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/classrooms/%@/resources?access_token=%@", self.aula.identifier, self.auth.accessToken]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:resourcesURL];
    
    // Indiquem que el metode utilitzat sera POST.
    [request setHTTPMethod:@"POST"];
    
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];

    [request setHTTPBody:jsonData];

    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init]completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                        
                        if ([data length] >0 && error == nil)
                        {
                            NSLog(@"post response - %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                            [self cargarRecursos];
                            
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
