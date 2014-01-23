//
//  PeopleListViewController.m
//  Ejemplo1
//
//  Created by UOC on 29/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "PeopleListViewController.h"
#import "PeopleViewController.h"

@interface PeopleListViewController ()

@end

@implementation PeopleListViewController
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
    
    self.persons = [[NSMutableArray alloc] init];
    [self cargarPerson];
    
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
    return [self.persons count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Recuperamos el evento correspondiente al numero de celda
    People *per = [self.persons objectAtIndex:indexPath.row];
    
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:per.username];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Iniciem la vista de people amb la People seleccionada.
    PeopleViewController *peopleViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"peopleView"];
    peopleViewController.people = [self.persons objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:peopleViewController animated:YES];
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarPerson
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // Definim la URL per obtenir la peopleList.
    /* UOCAPICALL /api/v1/people GET*/
    NSURL *peopleURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/people?access_token=%@", self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *peopleData = [NSData dataWithContentsOfURL:peopleURL];
        NSString *sT = [[NSString alloc] initWithData:peopleData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",sT);
        NSDictionary *peoDict = [NSJSONSerialization JSONObjectWithData:peopleData options:0 error:nil];
        
        if ([peoDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [peoDict valueForKey:@"error"], [peoDict valueForKey:@"error_description"]);
            return;
        }
        
        [self setDatos:peoDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Els canvis visuals nomes es poden fer en la cua principal.
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *peop in [dict objectForKey:@"people"]) {
        People *c = [[People alloc] init];
        [c setDatos:peop];
        [self.persons addObject:c];
    }
}


@end
