//
//  Mail.m
//  Ejemplo4
//
//  Created by pcastells on 11/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Mail.h"

@implementation Mail

- (void) setDatos:(NSDictionary *)eventDictionary
{
    self.identifier = [eventDictionary objectForKey:@"id"];
    self.subject        = [eventDictionary objectForKey:@"subject"];
    self.snippet    = [eventDictionary objectForKey:@"snippet"];
    self.date      = [eventDictionary objectForKey:@"date"];
    self.from      = [eventDictionary objectForKey:@"from"];
    self.to      = [eventDictionary objectForKey:@"to"];
    self.cc      = [eventDictionary objectForKey:@"cc"];
    self.body      = [eventDictionary objectForKey:@"body"];
    
}


@end
