//
//  Board.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Board.h"

@implementation Board

-(void) setDatos:(NSDictionary *)boardDictionary
{
    self.identifier = [boardDictionary objectForKey:@"id"];
    self.subtype = [boardDictionary objectForKey:@"subtype"];
    self.title = [boardDictionary objectForKey:@"title"];
    self.code = [boardDictionary objectForKey:@"code"];
    self.domainId = [boardDictionary objectForKey:@"domainId"];
    self.unreadMessages = [boardDictionary objectForKey:@"unreadMessages"];
    self.totalMessages = [boardDictionary objectForKey:@"totalMessages"];
}
@end
