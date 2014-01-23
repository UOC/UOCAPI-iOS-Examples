//
//  MailHistory.m
//  classroomsIdBoardsIdFoldersIdMessagesIdHistoryGet
//
//  Created by UOC on 09/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "MailHistory.h"
@implementation MailHistory

- (void) setDatos:(NSDictionary *)eventDictionary
{
    self.identifier = [eventDictionary objectForKey:@"id"];
    NSMutableArray *dets = [eventDictionary objectForKey:@"details"];
    // Mostrem l'array com una llista en forma d'string
    self.details = dets.description;
}

@end
