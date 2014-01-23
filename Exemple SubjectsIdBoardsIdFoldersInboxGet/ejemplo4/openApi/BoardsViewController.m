//
//  BoardsViewController.m
//  subjectsIdBoardsGet
//
//  Created by UOC on 13/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "BoardsViewController.h"
#import "FolderViewController.h"

@interface BoardsViewController ()

@end

@implementation BoardsViewController

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
    
    self.boards = [[NSMutableArray alloc] init];
    [self cargarBoards];
    
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
    return [self.boards count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Recuperamos el tauler correspondiente al numero de celda
    Board *board = [self.boards objectAtIndex:indexPath.row];
    
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:board.title];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Iniciem la vista que ens mostrara l'Inbox del tauler seleccionat.
    FolderViewController *folderViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"folderView"];
    folderViewController.board = [self.boards objectAtIndex:indexPath.row];
    folderViewController.aula = self.aula;
    folderViewController.auth = self.auth;
    [self.navigationController pushViewController:folderViewController animated:YES];
    
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarBoards
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/subjects/{id}/boards GET*/
    NSURL *boardURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/subjects/%@/boards?access_token=%@", self.aula.identifier, self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *boardData = [NSData dataWithContentsOfURL:boardURL ];
        NSDictionary *boardDict = [NSJSONSerialization JSONObjectWithData:boardData options:0 error:nil];
        
        if ([boardDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [boardDict valueForKey:@"error"], [boardDict valueForKey:@"error_description"]);
            return;
        }
        
        [self setDatos:boardDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)setDatos:(NSDictionary *)dict
{
    [self.boards removeAllObjects];
    for (NSDictionary *boa in [dict objectForKey:@"boards"]) {
        Board *b = [[Board alloc] init];
        [b setDatos:boa];
        [self.boards addObject:b];
    }
}
@end
