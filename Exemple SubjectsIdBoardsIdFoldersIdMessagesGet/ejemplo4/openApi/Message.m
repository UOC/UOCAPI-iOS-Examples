//
//  Message.m
//  subjectsIdBoardsIdFoldersIdMessagesGet
//
//  Created by UOC on 14/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "Message.h"

@implementation Message

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
