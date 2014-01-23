//
//  Setting.m
//  Ejemplo1
//
//  Created by UOC on 24/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Setting.h"

@implementation Setting

- (void) setDatos:(NSDictionary *)userDictionary
{
    self.identifier  = [userDictionary objectForKey:@"id"];
    self.title = [userDictionary objectForKey:@"title"];
    self.description = [userDictionary objectForKey:@"description"];
    self.section = [userDictionary objectForKey:@"section"];
    self.url = [userDictionary objectForKey:@"url"];
    self.value = [userDictionary objectForKey:@"value"];
    // s'hauria de fer una classe values{description,value} i afegir els valors a un NSMutableArray com es fa amb el settings.
    NSMutableDictionary *vals = [userDictionary objectForKey:@"values"];
    self.values = vals.description;
}

@end
