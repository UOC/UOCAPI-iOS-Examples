//
//  DestinationFolderViewController.m
//  MailFoldersIdMessagesIdMoveIdPost
//
//  Created by UOC on 19/08/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "DestinationFolderViewController.h"

@interface DestinationFolderViewController ()

@end

@implementation DestinationFolderViewController

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
/*STARTUOCAPIEXAMPLE*/
    /* UOCAPICALL /api/v1/mail/folders/{source_id}/messages/{id}/move/{destination_id} POST*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Agafem les dades de la carpeta seleccionada com a carpeta desti.
    Folder *folder = [self.folders objectAtIndex:indexPath.row];
    // Definim la URL per moure un mail d'una carpeta a la seleccionada.
    NSURL *resourcesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/mail/folders/%@/messages/%@/move/%@?access_token=%@", self.sourceFolder.identifier, self.message.identifier , folder.identifier , self.auth.accessToken]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:resourcesURL];
    
    // Indiquem que el metode que voles es POST
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init]completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if ([data length] >0 && error == nil)
        {
            NSLog(@"data response - %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            dispatch_async(dispatch_get_main_queue(), ^{
                // Les modificacions visuals nomes es poden realitzar a la cua principal.
                [[[UIAlertView alloc] initWithTitle:@"Mogut" message:@"S'ha mogut el missatge" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
                // Fem que la fila quedi desseleccionada despres de clicar.
                [tableView deselectRowAtIndexPath:indexPath animated:YES];
            });
        }
        else if ([data length] == 0 && error == nil)
        {
            NSLog(@"Nothing was downloaded.");
            dispatch_async(dispatch_get_main_queue(), ^{
                
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
            });
        }
        else if (error != nil){
            NSLog(@"Error = %@", error);
        }
        
    }];
}

- (void)cargarFolders
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/mail/folders GET*/
    // Definim la URL per veure les carpetes desti on moure el mail.
    NSURL *foldersURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/mail/folders?access_token=%@",  self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *foldersData = [NSData dataWithContentsOfURL:foldersURL];
        NSLog(@"%@",[[NSString alloc] initWithData:foldersData encoding:NSUTF8StringEncoding]);
        NSDictionary *foldersDict = [NSJSONSerialization JSONObjectWithData:foldersData options:0 error:nil];
        
        if ([foldersDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [foldersDict valueForKey:@"error"], [foldersDict valueForKey:@"error_description"]);
            return;
        }
        
        [self setDatos:foldersDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Les modificacions de la vista nomes es poden fer en la cua principal.
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)setDatos:(NSDictionary *)dict
{
    [self.folders removeAllObjects];
    for (NSDictionary *fold in [dict objectForKey:@"folders"]) {
        Folder *e = [[Folder alloc] init];
        [e setDatos:fold];
        [self.folders addObject:e];
    }
}


@end
