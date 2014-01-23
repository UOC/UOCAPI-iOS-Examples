//
//  Folder.m
//  MailFoldersIdMessagesGet
//
//  Created by UOC on 19/08/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
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
