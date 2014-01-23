//
//  MessagesViewController.m
//  MailMessagesGet
//
//  Created by UOC on 19/08/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MessagesViewController.h"
#import "MessageViewController.h"

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
    // Recuperamos el missatge correspondiente al numero de celda
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
    // Iniciem la vista per a veure el missatge seleccionat.
    MessageViewController *messageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"messageView"];
    messageViewController.message = [self.messages objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:messageViewController animated:YES];
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarMessages
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // Definim la URL per a obtenir els missatges.
    /* UOCAPICALL /api/v1/mail/messages GET*/
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/mail/messages?access_token=%@", self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
        NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
        NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
        
        if ([messagesDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
            return;
        }
        
        [self setDatos:messagesDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Els canvis visuals nomes es poden fer en la cua principal.
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}

- (void)setDatos:(NSDictionary *)dict
{
    // eliminem els missatges per evitar duplicats.
    [self.messages removeAllObjects];
    for (NSDictionary *fold in [dict objectForKey:@"messages"]) {
        Message *m = [[Message alloc] init];
        [m setDatos:fold];
        [self.messages addObject:m];
    }
}



////////////////
///// POST /////
////////////////
/* UOCAPICALL /api/v1/mail/messages POST*/
-(IBAction)newMessage{
    // Agafem la data actual.
    NSDate *date = [NSDate date];
    // Donem a la data el format pels missatges i ho guardem en un String
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"EEE MMM d HH:mm:ss 'CEST' yyyy"];
    NSString *dateString = [dateFormat stringFromDate:date];
    
    // Creem un diccionari amb les dades del missatge
    NSDictionary *resposta = @{@"id":@"31234124", @"subject":@"New Message", @"snippet":@"", @"date":dateString, @"color":@0, @"status":@0, @"from":@"me", @"to":@"you", @"cc":@"they", @"body":@"Lorem ipsum ..."};
    // Passem el diccionari a JSON
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:resposta options:NSJSONWritingPrettyPrinted error:nil];
    // Definim la URL per a enviar missatges.
    NSURL *resourcesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/mail/messages?access_token=%@", self.auth.accessToken]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:resourcesURL];
    
    // Indiquem que el metode a utilitzar es POST
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    [request setHTTPBody:jsonData];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init]completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if ([data length] >0 && error == nil)
        {
            NSLog(@"data response - %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            dispatch_async(dispatch_get_main_queue(), ^{
                // Els canvis visuals nomes es poden fer en la cua principal.
                [[[UIAlertView alloc] initWithTitle:@"Enviat" message:@"S'ha enviat el missatge" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
            });
            // Recarreguem els missatges.
            [self cargarMessages];
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
