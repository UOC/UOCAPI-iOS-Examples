//
//  MailsViewController.m
//  Ejemplo4
//
//  Created by UOC on 11/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MailsViewController.h"
#import "MailViewController.h"

@interface MailsViewController ()

@end

@implementation MailsViewController

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

    self.mails = [[NSMutableArray alloc] init];
    [self cargarMails];
   // NSLog(@"OK");

    
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
    return [self.mails count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Recuperamos el mail correspondiente al numero de celda
    Mail *mail = [self.mails objectAtIndex:indexPath.row];
    
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:mail.subject];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Iniciem la vista del missatge que ens permetra respondre aquest
    MailViewController *mailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"mailView"];
    mailViewController.mail = [self.mails objectAtIndex:indexPath.row];
    mailViewController.auth = self.auth;
    // Definim la URL del mail i la passem a la vista del missatge.
    mailViewController.mainURL = [NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/classrooms/%@/boards/%@/messages",self.aula.identifier, self.tauler.identifier];
    [self.navigationController pushViewController:mailViewController animated:YES];
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarMails
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/classrooms/{domain_id}/boards/{id}/messages GET*/
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/classrooms/%@/boards/%@/messages?access_token=%@",self.aula.identifier, self.tauler.identifier, self.auth.accessToken]];

    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
       //NSLog(@"messagesData - %@",[[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
        NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
        
        if ([messagesDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
            return;
        }
        
        [self setDatos:messagesDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *email in [dict objectForKey:@"messages"]) {
        Mail *e = [[Mail alloc] init];
        [e setDatos:email];
        [self.mails addObject:e];
    }
}


@end
