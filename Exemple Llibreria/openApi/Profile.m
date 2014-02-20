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

-(Profile *) getPeopleIdProfilesCurrent:(NSString *)iden withToken:(NSString *)token
{
    Profile *p = [[Profile alloc] init];
    
    NSURL *profileURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@people/%@/profiles/current?access_token=%@", baseUrl , iden, token]];
    
    
    NSData *profileData = [NSData dataWithContentsOfURL:profileURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:profileData encoding:NSUTF8StringEncoding]);
    NSDictionary *profileDict = [NSJSONSerialization JSONObjectWithData:profileData options:0 error:nil];
    
    if ([profileDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [profileDict valueForKey:@"error"], [profileDict valueForKey:@"error_description"]);
        return p;
    }
    
    [p setDatos:profileDict];
    
    return p;
}

-(Profile *) getUserProfilesCurrent:(NSString *)token
{
    Profile *p = [[Profile alloc] init];
    
    NSURL *profileURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@user/profiles/current?access_token=%@", baseUrl, token]];
    
    
    NSData *profileData = [NSData dataWithContentsOfURL:profileURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:profileData encoding:NSUTF8StringEncoding]);
    NSDictionary *profileDict = [NSJSONSerialization JSONObjectWithData:profileData options:0 error:nil];
    
    if ([profileDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [profileDict valueForKey:@"error"], [profileDict valueForKey:@"error_description"]);
        return p;
    }
    
    [p setDatos:profileDict];
    
    return p;
}

@end
