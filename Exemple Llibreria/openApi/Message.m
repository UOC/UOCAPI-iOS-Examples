//
//  Message.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Message.h"

@implementation Message

-(void) setDatos:(NSDictionary *)messageDictionary
{
    self.identifier = [messageDictionary objectForKey:@"id"];
    self.subject = [messageDictionary objectForKey:@"subject"];
    self.snippet = [messageDictionary objectForKey:@"snippet"];
    self.date = [messageDictionary objectForKey:@"date"];
    self.color = [messageDictionary objectForKey:@"color"];
    self.status = [messageDictionary objectForKey:@"status"];
    self.from = [messageDictionary objectForKey:@"from"];
    self.to = [messageDictionary objectForKey:@"to"];
    self.cc = [messageDictionary objectForKey:@"cc"];
    self.body = [messageDictionary objectForKey:@"body"];
}

@end
