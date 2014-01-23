//
//  MailBody.m
//  classroomsIdBoardsIdFoldersIdMessagesIdBodyGet
//
//  Created by UOC on 09/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "MailBody.h"

@implementation MailBody

- (void) setDatos:(NSDictionary *)eventDictionary
{
    self.identifier = [eventDictionary objectForKey:@"id"];
    self.body      = [eventDictionary objectForKey:@"body"];
    
}

@end
