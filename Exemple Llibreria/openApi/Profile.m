//
//  Profile.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Profile.h"

@implementation Profile

-(void) setDatos:(NSDictionary *)profileDictionary
{
    self.appId = [profileDictionary objectForKey:@"appId"];
    self.app = [profileDictionary objectForKey:@"app"];
    self.identifier = [profileDictionary objectForKey:@"id"];
    self.userSubtypeId = [profileDictionary objectForKey:@"userSubtypeId"];
    self.userType = [profileDictionary objectForKey:@"userType"];
    self.usertypeId = [profileDictionary objectForKey:@"usertypeId"];
    self.userSubtype = [profileDictionary objectForKey:@"userSubtype"];
    self.language = [profileDictionary objectForKey:@"language"];
}

@end
