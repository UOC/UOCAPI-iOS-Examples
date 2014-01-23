//
//  Resource.m
//  subjectsIdResourcesGet
//
//  Created by UOC on 13/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "Resource.h"

@implementation Resource

- (void) setDatos:(NSDictionary *)resourceDictionary
{
    self.identifier = [resourceDictionary objectForKey:@"id"];
    self.title = [resourceDictionary objectForKey:@"title"];
    self.type = [resourceDictionary objectForKey:@"type"];
    self.subtype = [resourceDictionary objectForKey:@"subtype"];
    self.code = [resourceDictionary objectForKey:@"code"];
    self.domainId = [resourceDictionary objectForKey:@"domainId"];
}

@end
