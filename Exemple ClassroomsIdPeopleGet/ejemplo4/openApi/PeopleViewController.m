//
//  PeopleViewController.m
//  ejemplo4
//
//  Created by UOC on 26/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "PeopleViewController.h"
#import "StuTeaViewController.h"

@interface PeopleViewController ()

@end

@implementation PeopleViewController

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
    
    self.celles = [[NSMutableArray alloc] init];
    [self cargarPeople];
    
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
    return [self.celles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Recuperamos el estudiante/profesor correspondiente al numero de celda
    User *usr = [self.celles objectAtIndex:indexPath.row];
    
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:usr.fullname];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Iniciem la vista que ens mostra les dades de l'alumne/professor seleccionat.
    StuTeaViewController *stuteaViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"stuteaView"];
    stuteaViewController.user = [self.celles objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:stuteaViewController animated:YES];
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarPeople
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // Definim la URL que ens dona les dades dels estudiants i professors de l'aula.
    /* UOCAPICALL /api/v1/classrooms/{id}/people GET*/
    NSURL *estURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/classrooms/%@/people?access_token=%@", self.aula.identifier, self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *estData = [NSData dataWithContentsOfURL:estURL ];
        NSDictionary *estDict = [NSJSONSerialization JSONObjectWithData:estData options:0 error:nil];
        
        if ([estDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [estDict valueForKey:@"error"], [estDict valueForKey:@"error_description"]);
            return;
        }
        
        [self setDatos:estDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // La vista nomes pot ser modificada en la cua principal.
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)setDatos:(NSDictionary *)dict
{
    [self.celles removeAllObjects];
    for (NSDictionary *est in [dict objectForKey:@"users"]) {
        User *e = [[User alloc] init];
        [e setDatos:est];
        [self.celles addObject:e];
    }
}

@end
