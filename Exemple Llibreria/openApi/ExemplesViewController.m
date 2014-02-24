//
//  ExemplesViewController.m
//  Llibreria
//
//  Created by UOC on 24/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "ExemplesViewController.h"
#import "EventsViewController.h"
#import "UserViewController.h"
#import "MessagesViewController.h"

@interface ExemplesViewController ()

@end

@implementation ExemplesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) getUser
{
    UserViewController *usViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"UserView"];
    usViewController.auth = self.auth;
    [self.navigationController pushViewController:usViewController animated:YES];
}

-(IBAction) getMailMessages
{
    MessagesViewController *mesViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MessagesView"];
    mesViewController.auth = self.auth;
    [self.navigationController pushViewController:mesViewController animated:YES];
}

-(IBAction) postCalendarEvents
{
    EventsViewController *evViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"EventsView"];
    evViewController.auth = self.auth;
    [self.navigationController pushViewController:evViewController animated:YES];
}
@end
