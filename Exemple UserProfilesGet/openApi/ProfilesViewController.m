//
//  ProfilesViewController.m
//  Ejemplo1
//
//  Created by UOC on 24/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "ProfilesViewController.h"
#import "ProfileViewController.h"
@interface ProfilesViewController ()

@end

@implementation ProfilesViewController


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
    
    self.profiles = [[NSMutableArray alloc] init];
    [self cargarPerfils];
    
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
    return [self.profiles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Recuperamos el perfil correspondiente al numero de celda
    Profile *perf = [self.profiles objectAtIndex:indexPath.row];
    
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:perf.ident];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Iniciem la vista que ens mostra el perfil seleccionat
    ProfileViewController *resourcesViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"profileView"];
    resourcesViewController.profile = [self.profiles objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:resourcesViewController animated:YES];
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarPerfils
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/user/profiles GET*/
    // Definim la URL que ens dona les dades de la profileList.
    NSURL *profilesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/user/profiles?access_token=%@", self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *profilesData = [NSData dataWithContentsOfURL:profilesURL];
        
        NSDictionary *profilesDict = [NSJSONSerialization JSONObjectWithData:profilesData options:0 error:nil];
        
        if ([profilesDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [profilesDict valueForKey:@"error"], [profilesDict valueForKey:@"error_description"]);
            return;
        }
        
        [self setDatos:profilesDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Les modificacions visuals nomes es poden realitzar en la cua principal.
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)setDatos:(NSDictionary *)dict
{
    [self.profiles removeAllObjects];
    for (NSDictionary *prof in [dict objectForKey:@"profiles"]) {
        Profile *c = [[Profile alloc] init];
        [c setDatos:prof];
        [self.profiles addObject:c];
    }
}



@end
