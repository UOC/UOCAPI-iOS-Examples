//
//  TeachingMaterial.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "TeachingMaterial.h"

@implementation TeachingMaterial

-(void) setDatos:(NSDictionary *)materialDictionary
{
    self.identifier = [materialDictionary objectForKey:@"id"];
    self.type = [materialDictionary objectForKey:@"type"];
    self.title = [materialDictionary objectForKey:@"title"];
    self.url = [materialDictionary objectForKey:@"url"];
}

@end
