//
//  MessageBody.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MessageBody.h"

@implementation MessageBody

-(void) setDatos:(NSDictionary *)bodyDictionary
{
    self.identifier = [bodyDictionary objectForKey:@"id"];
    self.body = [bodyDictionary objectForKey:@"body"];
}

@end
