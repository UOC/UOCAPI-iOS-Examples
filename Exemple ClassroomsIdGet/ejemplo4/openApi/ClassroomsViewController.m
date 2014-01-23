//
//  ClassroomsViewController.m
//  ejemplo4
//
//  Created by UOC on 16/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "ClassroomsViewController.h"
#import "ClassroomViewController.h"

@interface ClassroomsViewController ()

@end

@implementation ClassroomsViewController

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
    
    self.classrooms = [[NSMutableArray alloc] init];
    [self cargarAulas];
    
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
    return [self.classrooms count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Recuperamos el aula correspondiente al numero de celda
    Classroom *aula = [self.classrooms objectAtIndex:indexPath.row];
    
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:aula.title];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Iniciem la vista que carrega l'aula que hem seleccionat. Hi passem l'identificador per saber de quina aula es tracta.
    ClassroomViewController *classroomViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ClassroomView"];
    classroomViewController.idAula = [[self.classrooms objectAtIndex:indexPath.row] identifier];
    classroomViewController.auth = self.auth;
    [self.navigationController pushViewController:classroomViewController animated:YES];
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarAulas
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/classrooms GET*/
    NSURL *classroomsURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/classrooms?access_token=%@", self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *classroomsData = [NSData dataWithContentsOfURL:classroomsURL];
        //NSLog(@"%@",[[NSString alloc] initWithData:classroomsData encoding:NSUTF8StringEncoding]);
        NSDictionary *classroomsDict = [NSJSONSerialization JSONObjectWithData:classroomsData options:0 error:nil];
        
        if ([classroomsDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [classroomsDict valueForKey:@"error"], [classroomsDict valueForKey:@"error_description"]);
            return;
        }
        
        [self setDatos:classroomsDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *classroom in [dict objectForKey:@"classrooms"]) {
        Classroom *c = [[Classroom alloc] init];
        [c setDatos:classroom];
        [self.classrooms addObject:c];
    }
}



@end
