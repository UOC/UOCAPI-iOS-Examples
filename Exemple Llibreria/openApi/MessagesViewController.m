//
//  MessagesViewController.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MessagesViewController.h"

@interface MessagesViewController ()

@end

@implementation MessagesViewController

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
    
    self.messages = [[NSMutableArray alloc] init];
    [self cargarMessages];
    
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
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Recuperamos el evento correspondiente al numero de celda
    Message *message = [self.messages objectAtIndex:indexPath.row];
    
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:message.subject];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HistoryViewController *messageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"historyView"];
    messageViewController.idMessage = [[self.messages objectAtIndex:indexPath.row] identifier];
    messageViewController.auth = self.auth;
    [self.navigationController pushViewController:messageViewController animated:YES];
}

/*STARTUOCAPIEXAMPLE*/
- (void)cargarMessages
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/mail/messages GET*/
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    // Exemple utilitzant la llibreria
    dispatch_async(backgroundQueue, ^{
        self.messages = [[MessageList alloc] getMailMessages:self.auth.accessToken];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/

- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *fold in [dict objectForKey:@"messages"]) {
        Message *m = [[Message alloc] init];
        [m setDatos:fold];
        [self.messages addObject:m];
    }
}
@end
