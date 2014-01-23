//
//  People.m
//  Ejemplo1
//
//  Created by UOC on 29/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "People.h"

@implementation People

- (void) setDatos:(NSDictionary *)peopleDictionary
{
    self.identifier = [peopleDictionary objectForKey:@"id"];
    self.username = [peopleDictionary objectForKey:@"username"];
    self.name = [peopleDictionary objectForKey:@"name"];
    self.surname1 = [peopleDictionary objectForKey:@"surname1"];
    self.surname2 = [peopleDictionary objectForKey:@"surname2"];
    self.email = [peopleDictionary objectForKey:@"email"];
    //self.profiles = [peopleDictionary objectForKey:@"profiles"];
    self.userNumber = [peopleDictionary objectForKey:@"userNumber"];
    self.hobbies = [peopleDictionary objectForKey:@"hobbies"];
    self.skills = [peopleDictionary objectForKey:@"skills"];
    self.about = [peopleDictionary objectForKey:@"about"];
    self.NGOes = [peopleDictionary objectForKey:@"NGOes"];
    self.languages = [peopleDictionary objectForKey:@"languages"];
    self.secondaryEmail = [peopleDictionary objectForKey:@"secondaryEmail"];
    self.blog = [peopleDictionary objectForKey:@"blog"];
    self.personalSite = [peopleDictionary objectForKey:@"personalSite"];
    NSNumber *lastUpNum = [peopleDictionary objectForKey:@"lastUpdate"];
    self.lastUpdate = [NSDate dateWithTimeIntervalSince1970:(([lastUpNum longLongValue]/ 1000)+7200)];
}


@end
