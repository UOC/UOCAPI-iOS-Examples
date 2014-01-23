//
//  Message.m
//  Exemple Receptor2
//
//  Created by UOC on 05/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Message.h"

@implementation Message

- (void) setDatos:(NSDictionary *)dict
{
    self.identifier = [dict objectForKey:@"id"];
    self.subject = [dict objectForKey:@"subject"];
    self.snippet = [dict objectForKey:@"snippet"];
    self.date = [dict objectForKey:@"date"];
    self.color = [dict objectForKey:@"color"];
    self.status = [dict objectForKey:@"status"];
    self.from = [dict objectForKey:@"from"];
    self.to = [dict objectForKey:@"to"];
    self.cc = [dict objectForKey:@"cc"];
    self.body = [dict objectForKey:@"body"];
}

@end
