//
//  FoldersViewController.m
//  Ejemplo2
//
//  Created by UOC on 12/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "FoldersViewController.h"
#import "FolderViewController.h"

@interface FoldersViewController ()

@end

@implementation FoldersViewController

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

    self.folders = [[NSMutableArray alloc] init];
    [self cargarFolders];
    
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
    return [self.folders count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Recuperamos la carpeta correspondiente al numero de celda
    Folder *folder = [self.folders objectAtIndex:indexPath.row];
    
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:folder.name];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Iniciem la vista de folder amb el valor de la carpeta seleccionada.
    FolderViewController *folderViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"folderView"];
    folderViewController.folder = [self.folders objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:folderViewController animated:YES];
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarFolders
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // Definim la URL per a obtenir les dades de les carpetes.
    /* UOCAPICALL /api/v1/mail/folders GET*/
    NSURL *foldersURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/mail/folders?access_token=%@", self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *foldersData = [NSData dataWithContentsOfURL:foldersURL];
        NSLog(@"Data - %@", [[NSString alloc] initWithData:foldersData encoding:NSUTF8StringEncoding]);
        NSDictionary *foldersDict = [NSJSONSerialization JSONObjectWithData:foldersData options:0 error:nil];
        
        if ([foldersDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [foldersDict valueForKey:@"error"], [foldersDict valueForKey:@"error_description"]);
            return;
        }
        
        [self setDatos:foldersDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // La vista nomes pot ser modificada a la cua principal.
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *fold in [dict objectForKey:@"folders"]) {
        Folder *f = [[Folder alloc] init];
        [f setDatos:fold];
        [self.folders addObject:f];
    }
}

@end
