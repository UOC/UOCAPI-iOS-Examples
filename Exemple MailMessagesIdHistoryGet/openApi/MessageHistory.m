//
//  MessageHistory.m
//  MailMessagesIdHistoryGet
//
//  Created by UOC on 19/08/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MessageHistory.h"

@implementation MessageHistory

- (void) setDatos:(NSDictionary *)eventDictionary
{
    self.identifier = [eventDictionary objectForKey:@"id"];
    NSMutableArray *dets    = [eventDictionary objectForKey:@"details"];
    // Assignem a l'String details la llista de details de manera compacta.
    self.details = dets.description;
    
}

@end
