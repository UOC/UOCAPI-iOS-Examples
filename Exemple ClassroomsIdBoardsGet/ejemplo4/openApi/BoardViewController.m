//
//  BoardViewController.m
//  ejemplo4
//
//  Created by UOC on 26/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "BoardViewController.h"

@interface BoardViewController ()

@end

@implementation BoardViewController

- (void)loadView
{
    [super loadView];
    
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id board: %@", self.board.identifier];
    self.subtype.text    = [[NSString alloc] initWithFormat:@"subtipus board: %@", self.board.subtype];
    self.titol.text    = [[NSString alloc] initWithFormat:@"títol board: %@" , self.board.title];
    self.code.text    = [[NSString alloc] initWithFormat:@"codi board: %@", self.board.code];
    self.domainId.text    = [[NSString alloc] initWithFormat:@"id aula: %@", self.board.domainId];
    self.unread.text    = [[NSString alloc] initWithFormat:@"unread Messages: %@", self.board.unreadMessages];
    self.total.text    = [[NSString alloc] initWithFormat:@"total Messages: %@", self.board.totalMessages];

    
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
