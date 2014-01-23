//
//  Person.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void) setDatos:(NSDictionary *)personDictionary
{
    self.profiles = [[NSMutableArray alloc] init];
    
    self.identifier = [personDictionary objectForKey:@"id"];
    self.username = [personDictionary objectForKey:@"username"];
    self.name = [personDictionary objectForKey:@"name"];
    self.surname1 = [personDictionary objectForKey:@"surname1"];
    self.surname2 = [personDictionary objectForKey:@"surname2"];
    self.email = [personDictionary objectForKey:@"email"];
    for (NSDictionary *profile in [personDictionary objectForKey:@"profiles"]){
        Profile *p = [[Profile alloc] init];
        [p setDatos:profile];
        [self.profiles addObject:p];
    }
    self.userNumber = [personDictionary objectForKey:@"userNumber"];
    self.hobbies = [personDictionary objectForKey:@"hobbies"];
    self.skills = [personDictionary objectForKey:@"skills"];
    self.about = [personDictionary objectForKey:@"about"];
    self.NGOes = [personDictionary objectForKey:@"NGOes"];
    self.languages = [personDictionary objectForKey:@"languages"];
    self.secondaryEmail = [personDictionary objectForKey:@"secondaryEmail"];
    self.blog = [personDictionary objectForKey:@"blog"];
    self.personalSite = [personDictionary objectForKey:@"personalSite"];
    NSNumber *lastUpNum = [personDictionary objectForKey:@"lastUpdate"];
    self.lastUpdate = [NSDate dateWithTimeIntervalSince1970:(([lastUpNum longLongValue]/ 1000)+7200)];
}

@end
