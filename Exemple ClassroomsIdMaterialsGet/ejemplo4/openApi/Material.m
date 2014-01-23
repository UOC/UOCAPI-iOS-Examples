//
//  Material.m
//  ejemplo4
//
//  Created by UOC on 26/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "Material.h"

@implementation Material

- (void) setDatos:(NSDictionary *)materialDictionary
{
    self.identifier = [materialDictionary objectForKey:@"id"];
    self.title = [materialDictionary objectForKey:@"title"];
    self.type = [materialDictionary objectForKey:@"type"];
    self.url = [materialDictionary objectForKey:@"url"];
}


@end
