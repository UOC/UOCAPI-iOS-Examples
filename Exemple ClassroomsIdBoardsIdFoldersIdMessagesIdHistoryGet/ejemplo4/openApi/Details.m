//
//  Details.m
//  classroomsIdBoardsIdFoldersIdMessagesIdHistoryGet
//
//  Created by UOC on 09/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "Details.h"

@implementation Details
- (void) setDatos:(NSDictionary *)eventDictionary
{
    self.action = [eventDictionary objectForKey:@"action"];
    self.date      = [eventDictionary objectForKey:@"date"];
    self.name      = [eventDictionary objectForKey:@"name"];
    self.time      = [eventDictionary objectForKey:@"time"];
    
}
@end
