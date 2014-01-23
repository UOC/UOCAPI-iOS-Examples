//
//  MessageBody.m
//  MailMessagesIdBodyGet
//
//  Created by UOC on 19/08/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MessageBody.h"

@implementation MessageBody

- (void) setDatos:(NSDictionary *)eventDictionary
{
    self.identifier = [eventDictionary objectForKey:@"id"];
    self.body      = [eventDictionary objectForKey:@"body"];
    
}

@end
