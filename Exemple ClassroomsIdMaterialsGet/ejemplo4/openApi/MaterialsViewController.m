//
//  MaterialsViewController.m
//  ejemplo4
//
//  Created by UOC on 26/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "MaterialsViewController.h"
#import "MaterialViewController.h"

@interface MaterialsViewController ()

@end

@implementation MaterialsViewController

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
    
    self.materials = [[NSMutableArray alloc] init];
    [self cargarMaterials];
    
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
    return [self.materials count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Recuperamos el material correspondiente al numero de celda
    Material *mat = [self.materials objectAtIndex:indexPath.row];
    
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:mat.title];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Iniciem la vista de material amb el material seleccionat.
    MaterialViewController *materialViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"materialView"];
    materialViewController.material = [self.materials objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:materialViewController animated:YES];
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarMaterials
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // Definim la URL per a obtenir les dades dels materials.
    /* UOCAPICALL /api/v1/classrooms/{id}/materials GET*/
    NSURL *matURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/classrooms/%@/materials?access_token=%@", self.aula.identifier, self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *matData = [NSData dataWithContentsOfURL:matURL ];
        NSLog(@"materialData - %@", [[NSString alloc] initWithData:matData encoding:NSUTF8StringEncoding]);
        NSDictionary *matDict = [NSJSONSerialization JSONObjectWithData:matData options:0 error:nil];
        
        if ([matDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [matDict valueForKey:@"error"], [matDict valueForKey:@"error_description"]);
            return;
        }
        
        [self setDatos:matDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Per actualitzar la vista cal estar en la cua principal.
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)setDatos:(NSDictionary *)dict
{
    [self.materials removeAllObjects];
    for (NSDictionary *mat in [dict objectForKey:@"materials"]) {
        Material *m = [[Material alloc] init];
        [m setDatos:mat];
        [self.materials addObject:m];
    }
}


@end
