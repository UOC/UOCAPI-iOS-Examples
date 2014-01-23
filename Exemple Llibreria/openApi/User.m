//
//  User.m
//  Llibreria
//
//  Created by Oscar Iglesias Lopez on 17/05/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "User.h"

@implementation User


- (void) setDatos:(NSDictionary *)userDictionary
{
    self.identifier  = [userDictionary objectForKey:@"id"];
    self.username    = [userDictionary objectForKey:@"username"];
    self.name        = [userDictionary objectForKey:@"name"];
    self.number      = [userDictionary objectForKey:@"number"];
    self.fullname    = [userDictionary objectForKey:@"fullName"];
    self.language    = [userDictionary objectForKey:@"language"];
    self.sessionID   = [userDictionary objectForKey:@"sessionId"];
    self.email       = [userDictionary objectForKey:@"email"];
    
    NSURL *photoURL     = [NSURL URLWithString:[userDictionary objectForKey:@"photoUrl"]];
    NSData *photoData   = [NSData dataWithContentsOfURL:photoURL];
    self.photo          = [UIImage imageWithData:photoData];
}

@end