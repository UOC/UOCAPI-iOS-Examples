//
//  Folder.m
//  subjectsIdBoardsIdFoldersGet
//
//  Created by UOC on 13/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "Folder.h"

@implementation Folder

- (void) setDatos:(NSDictionary *)eventDictionary
{
    self.identifier = [eventDictionary objectForKey:@"id"];
    self.name        = [eventDictionary objectForKey:@"name"];
    self.unread    = [eventDictionary objectForKey:@"unreadMessages"];
    self.total      = [eventDictionary objectForKey:@"totalMessages"];
    
}

@end
