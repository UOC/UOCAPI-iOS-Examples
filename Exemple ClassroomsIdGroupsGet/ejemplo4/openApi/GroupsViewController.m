//
//  GroupsViewController.m
//  ejemplo4
//
//  Created by UOC on 26/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "GroupsViewController.h"

@interface GroupsViewController ()

@end

@implementation GroupsViewController

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
    
    self.grups = [[NSMutableArray alloc] init];
    [self cargarGrups];
    
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
    return [self.grups count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Recuperamos el grupo correspondiente al numero de celda
    Classroom *workG = [self.grups objectAtIndex:indexPath.row];
    
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:workG.title];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Iniciem la vista de grup amb el valor del grup seleccionat
    GroupViewController *groupViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"groupView"];
    groupViewController.aula = [self.grups objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:groupViewController animated:YES];
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarGrups
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/classrooms/{id}/groups GET*/
    // Definim la url que obte les dades dels grups de l'aula seleccionada
    NSURL *groupsURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/classrooms/%@/groups?access_token=%@", self.aula.identifier, self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *groupsData = [NSData dataWithContentsOfURL:groupsURL ];
        //NSLog(@"%@",[[NSString alloc]initWithData:groupsData encoding:NSUTF8StringEncoding]);
        NSDictionary *groupsDict = [NSJSONSerialization JSONObjectWithData:groupsData options:0 error:nil];
        
        if ([groupsDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [groupsDict valueForKey:@"error"], [groupsDict valueForKey:@"error_description"]);
            return;
        }
        
        [self setDatos:groupsDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Nomes podem modificar la vista en la cua principal
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)setDatos:(NSDictionary *)dict
{
    [self.grups removeAllObjects];
    for (NSDictionary *grp in [dict objectForKey:@"classrooms"]) {
        Classroom *g = [[Classroom alloc] init];
        [g setDatos:grp];
        [self.grups addObject:g];
    }
}


@end
