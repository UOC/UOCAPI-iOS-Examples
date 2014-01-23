//
//  History.m
//  subjectsIdBoardsIdFoldersIdMessagesIdHistoryGet
//
//  Created by UOC on 14/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "History.h"

@implementation History

- (void) setDatos:(NSDictionary *)eventDictionary
{
    self.identifier = [eventDictionary objectForKey:@"id"];
    // Mostrem l'array de detalls com a un String mitjancant la description.
    NSMutableArray *dets = [eventDictionary objectForKey:@"details"];
    self.details = dets.description;
}

@end
