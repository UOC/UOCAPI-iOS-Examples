//
//  ResourceViewController.m
//  ejemplo4
//
//  Created by UOC on 16/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "ResourceViewController.h"

@interface ResourceViewController ()

@end

@implementation ResourceViewController

- (void)loadView
{
    [super loadView];
    
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id recurs: %@", self.recurs.identifier];
    self.type.text    = [[NSString alloc] initWithFormat:@"tipus recurs: %@", self.recurs.type];
    self.subtype.text    = [[NSString alloc] initWithFormat:@"subtipus recurs: %@", self.recurs.subtype];
    self.titol.text    = [[NSString alloc] initWithFormat:@"títol recurs: %@" , self.recurs.title];
    self.code.text    = [[NSString alloc] initWithFormat:@"codi recurs: %@", self.recurs.code];
    self.domainId.text    = [[NSString alloc] initWithFormat:@"id aula: %@", self.recurs.domainId];

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
