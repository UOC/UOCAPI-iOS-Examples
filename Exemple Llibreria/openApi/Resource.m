//
//  Resource.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Resource.h"

@implementation Resource

-(void) setDatos:(NSDictionary *)resourceDictionary
{
    self.identifier = [resourceDictionary objectForKey:@"id"];
    self.type = [resourceDictionary objectForKey:@"type"];
    self.subtype = [resourceDictionary objectForKey:@"subtype"];
    self.title = [resourceDictionary objectForKey:@"title"];
    self.code = [resourceDictionary objectForKey:@"code"];
    self.domainId = [resourceDictionary objectForKey:@"domainId"];
}

@end
