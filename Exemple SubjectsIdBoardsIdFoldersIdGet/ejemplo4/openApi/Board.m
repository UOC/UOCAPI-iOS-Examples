//
//  Board.m
//  subjectsIdBoardsGet
//
//  Created by UOC on 13/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "Board.h"

@implementation Board

- (void) setDatos:(NSDictionary *)boardDictionary
{
    self.identifier = [boardDictionary objectForKey:@"id"];
    self.title = [boardDictionary objectForKey:@"title"];
    self.subtype = [boardDictionary objectForKey:@"subtype"];
    self.code = [boardDictionary objectForKey:@"code"];
    self.domainId = [boardDictionary objectForKey:@"domainId"];
    self.unreadMessages = [boardDictionary objectForKey:@"unreadMessages"];
    self.totalMessages = [boardDictionary objectForKey:@"totalMessages"];
}

@end
