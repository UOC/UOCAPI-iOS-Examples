//
//  Profile.m
//  Ejemplo1
//
//  Created by UOC on 24/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Profile.h"

@implementation Profile
- (void) setDatos:(NSDictionary *)userDictionary
{
    self.appId = [userDictionary objectForKey:@"appId"];
    self.app = [userDictionary objectForKey:@"app"];
    self.ident = [userDictionary objectForKey:@"id"];
    self.userSubtypeId = [userDictionary objectForKey:@"userSubtypeId"];
    self.userType = [userDictionary objectForKey:@"userType"];
    self.usertypeId = [userDictionary objectForKey:@"usertypeId"];
    self.userSubtype = [userDictionary objectForKey:@"userSubtype"];
    self.language    = [userDictionary objectForKey:@"language"];
    
}
@end
