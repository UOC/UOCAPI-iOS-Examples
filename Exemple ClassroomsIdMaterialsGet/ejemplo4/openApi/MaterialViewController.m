//
//  MaterialViewController.m
//  ejemplo4
//
//  Created by UOC on 26/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "MaterialViewController.h"

@interface MaterialViewController ()

@end

@implementation MaterialViewController


- (void)loadView
{
    [super loadView];
    
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id material: %@", self.material.identifier];
    self.type.text    = [[NSString alloc] initWithFormat:@"tipus material: %@", self.material.type];
    self.titol.text    = [[NSString alloc] initWithFormat:@"títol: %@" , self.material.title];
    self.url.text    = [[NSString alloc] initWithFormat:@"%@", self.material.url];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
