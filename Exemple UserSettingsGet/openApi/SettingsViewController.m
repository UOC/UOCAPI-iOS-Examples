//
//  SettingsViewController.m
//  Ejemplo1
//
//  Created by UOC on 24/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
    
    self.settings = [[NSMutableArray alloc] init];
    [self cargarSettings];
    
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
    return [self.settings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Recuperamos el setting correspondiente al numero de celda
    Setting *sett = [self.settings objectAtIndex:indexPath.row];
    
    // Recuperamos el nombre que queremos poner de titulo a la celda
    NSString *CellIdentifier = [[NSString alloc] initWithString:sett.title];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = CellIdentifier;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Iniciem la vista que ens mostrara el setting seleccionat.
    SettingViewController *settingViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"settingView"];
    settingViewController.setting = [self.settings objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:settingViewController animated:YES];
}
/*STARTUOCAPIEXAMPLE*/
- (void)cargarSettings
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/user/settings GET*/
    // Definim la URL que ens dona les dades dels settings
    NSURL *settingsURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/user/settings?access_token=%@", self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *settingsData = [NSData dataWithContentsOfURL:settingsURL];
        NSString *sT = [[NSString alloc] initWithData:settingsData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",sT);
        NSDictionary *settingsDict = [NSJSONSerialization JSONObjectWithData:settingsData options:0 error:nil];
        
        if ([settingsDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [settingsDict valueForKey:@"error"], [settingsDict valueForKey:@"error_description"]);
            return;
        }
        
        [self setDatos:settingsDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Les modificacions de la vista en la cua principal.
            [self.tableView reloadData];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *prof in [dict objectForKey:@"settings"]) {
        Setting *c = [[Setting alloc] init];
        [c setDatos:prof];
        [self.settings addObject:c];
    }
}

@end
