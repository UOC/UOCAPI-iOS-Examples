//
//  TutorsViewController.m
//  Ejemplo1
//
//  Created by UOC on 24/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "TutorsViewController.h"
#import "TutorViewController.h"

@interface TutorsViewController ()

@end

@implementation TutorsViewController

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
    
    self.tutors = [[NSMutableArray alloc] init];
    [self cargarTutors];
    
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
    return [self.tutors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Recuperamos el tutor correspondiente al numero de celda
    User *tut = [self.tutors objectAtIndex:indexPath.row];
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:tut.fullname];

    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Iniciem la vista del tutor que s'hagi seleccionat.
    TutorViewController *tutorsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"tutorView"];
    tutorsViewController.auth = self.auth;
    tutorsViewController.tutor = [self.tutors objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:tutorsViewController animated:YES];
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarTutors
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/people/{id}/tutors GET*/
    // Definim la URL per a obtenir les dades dels tutors de la persona en questio.
    NSURL *tutorsURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/people/%@/tutors?access_token=%@", self.person.identifier, self.auth.accessToken]];
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *tutorsData = [NSData dataWithContentsOfURL:tutorsURL];

        NSDictionary *tutorsDict = [[NSDictionary alloc] init];

        if ([tutorsData length] > 0) tutorsDict = [NSJSONSerialization JSONObjectWithData:tutorsData options:0 error:nil];

        if ([tutorsDict valueForKey:@"error"]) {
            NSLog(@"ERROR %@: %@", [tutorsDict valueForKey:@"error"], [tutorsDict valueForKey:@"error_description"]);
            return;
        }
        [self setDatos:tutorsDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Les modificacions de la vista nomes es poden fer a la cua principal.
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *prof in [dict objectForKey:@"users"]) {
        User *c = [[User alloc] init];
        [c setDatos:prof];
        [self.tutors addObject:c];
    }
}


@end
