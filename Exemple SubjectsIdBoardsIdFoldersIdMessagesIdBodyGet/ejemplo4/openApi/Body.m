//
//  Body.m
//  subjectsIdBoardsIdFoldersIdMessagesIdBodyGet
//
//  Created by UOC on 14/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "Body.h"

@implementation Body

- (void) setDatos:(NSDictionary *)eventDictionary
{
    self.identifier = [eventDictionary objectForKey:@"id"];
    self.body      = [eventDictionary objectForKey:@"body"];
    
}
@end
