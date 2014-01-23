//
//  Folder.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Folder.h"

@implementation Folder

-(void) setDatos:(NSDictionary *)folderDictionary
{
    self.identifier = [folderDictionary objectForKey:@"id"];
    self.name = [folderDictionary objectForKey:@"name"];
    self.unreadMessages = [folderDictionary objectForKey:@"unreadMessages"];
    self.totalMessages = [folderDictionary objectForKey:@"totalMessages"];
}

@end
