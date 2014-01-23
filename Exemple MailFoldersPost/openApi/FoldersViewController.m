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
    // Iniciem la vista que ens mostra la carpeta seleccionada.
    FolderViewController *folderViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"folderView"];
    folderViewController.folder = [self.folders objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:folderViewController animated:YES];
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarFolders
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // Definim la URL que ens dona les dades de les carpetes.
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
            // Els canvis visuals nomes es poden fer en la cua principal.
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}

- (void)setDatos:(NSDictionary *)dict
{
    [self.folders removeAllObjects];
    for (NSDictionary *fold in [dict objectForKey:@"folders"]) {
        Folder *f = [[Folder alloc] init];
        [f setDatos:fold];
        [self.folders addObject:f];
    }
}
/* UOCAPICALL /api/v1/mail/folders POST*/
-(IBAction)newFolder
{
    // Creem un diccionari amb les dades d'una carpeta.
    NSDictionary *carpeta = @{@"id":@"14", @"name":@"Nova Carpeta", @"unreadMessages":@"312", @"totalMessages":@"444"};
    // Passem el diccionari en format JSON
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:carpeta options:NSJSONWritingPrettyPrinted error:nil];
    // Definim la URL per a les carpetes
    NSURL *foldersURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/mail/folders?access_token=%@", self.auth.accessToken]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:foldersURL];
    
    // Indiquem que volem fer un POST
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    [request setHTTPBody:jsonData];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init]completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if ([data length] >0 && error == nil)
        {
            NSLog(@"data response - %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            dispatch_async(dispatch_get_main_queue(), ^{
                // Els canvis visuals nomes es poden fer en la cua principal.
                [[[UIAlertView alloc] initWithTitle:@"Creada" message:@"S'ha creat una nova carpeta" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
            });
            // Recarreguem les carpetes.
            [self cargarFolders];
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
