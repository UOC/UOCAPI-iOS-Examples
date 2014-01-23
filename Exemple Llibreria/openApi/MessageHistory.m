//
//  MessageHistory.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MessageHistory.h"

@implementation MessageHistory

-(void)setDatos:(NSDictionary *)historyDictionary
{
    self.details = [[NSMutableArray alloc] init];
    
    self.identifier = [historyDictionary objectForKey:@"id"];
    for (NSDictionary *detail in [historyDictionary objectForKey:@"details"]) {
        MessageHistoryDetail *d = [[MessageHistoryDetail alloc] init];
        [d setDatos:detail];
        [self.details addObject:d];
    }
}

@end
