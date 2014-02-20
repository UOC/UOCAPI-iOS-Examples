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

- (Folder *) getClassroomsIdBoardsIdFoldersInbox:(NSString *)idenC BoardId:(NSString *)idenB withToken:(NSString *)token
{
    Folder *f = [[Folder alloc] init];
    
    
    NSURL *inboxURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/folders/inbox?access_token=%@", baseUrl , idenC, idenB, token]];
    
    
    NSData *inboxData = [NSData dataWithContentsOfURL:inboxURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:inboxData encoding:NSUTF8StringEncoding]);
    NSDictionary *inboxDict = [NSJSONSerialization JSONObjectWithData:inboxData options:0 error:nil];
    
    if ([inboxDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [inboxDict valueForKey:@"error"], [inboxDict valueForKey:@"error_description"]);
        return f;
    }
    
    [f setDatos:inboxDict];
    
    return f;
}


- (Folder *) getClassroomsIdBoardsIdFoldersId:(NSString *)idenC BoardId:(NSString *)idenB  FolderId:(NSString *)idenF withToken:(NSString *)token
{
    Folder *f = [[Folder alloc] init];
    
    
    NSURL *folderURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/folders/%@?access_token=%@", baseUrl , idenC, idenB, idenF, token]];
    
    
    NSData *folderData = [NSData dataWithContentsOfURL:folderURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:folderData encoding:NSUTF8StringEncoding]);
    NSDictionary *folderDict = [NSJSONSerialization JSONObjectWithData:folderData options:0 error:nil];
    
    if ([folderDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [folderDict valueForKey:@"error"], [folderDict valueForKey:@"error_description"]);
        return f;
    }
    
    [f setDatos:folderDict];
    
    return f;
}

- (Folder *) getMailFoldersInbox:(NSString *)token
{
    Folder *f = [[Folder alloc] init];
    
    NSURL *folderURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/folders/inbox?access_token=%@", baseUrl, token]];
    
    
    NSData *folderData = [NSData dataWithContentsOfURL:folderURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:folderData encoding:NSUTF8StringEncoding]);
    NSDictionary *folderDict = [NSJSONSerialization JSONObjectWithData:folderData options:0 error:nil];
    
    if ([folderDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [folderDict valueForKey:@"error"], [folderDict valueForKey:@"error_description"]);
        return f;
    }
    
    [f setDatos:folderDict];
    
    return f;
}

- (Folder *) getMailFoldersId:(NSString *)iden withToken:(NSString *)token
{
    Folder *f = [[Folder alloc] init];
    
     NSURL *folderURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/folders/%@?access_token=%@", baseUrl , iden, token]];
    
    
    NSData *folderData = [NSData dataWithContentsOfURL:folderURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:folderData encoding:NSUTF8StringEncoding]);
    NSDictionary *folderDict = [NSJSONSerialization JSONObjectWithData:folderData options:0 error:nil];
    
    if ([folderDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [folderDict valueForKey:@"error"], [folderDict valueForKey:@"error_description"]);
        return f;
    }
    
    [f setDatos:folderDict];
    
    return f;
}

- (Folder *) getSubjectsIdBoardsIdFoldersInbox:(NSString *)idenS BoardId:(NSString *)idenB withToken:(NSString *)token
{
    Folder *f = [[Folder alloc] init];
    
    
    NSURL *inboxURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/folders/inbox?access_token=%@", baseUrl , idenS, idenB, token]];
    
    
    NSData *inboxData = [NSData dataWithContentsOfURL:inboxURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:inboxData encoding:NSUTF8StringEncoding]);
    NSDictionary *inboxDict = [NSJSONSerialization JSONObjectWithData:inboxData options:0 error:nil];
    
    if ([inboxDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [inboxDict valueForKey:@"error"], [inboxDict valueForKey:@"error_description"]);
        return f;
    }
    
    [f setDatos:inboxDict];
    
    return f;
}

- (Folder *) getSubjectsIdBoardsIdFoldersId:(NSString *)idenS BoardId:(NSString *)idenB  FolderId:(NSString *)idenF withToken:(NSString *)token
{
    Folder *f = [[Folder alloc] init];
    
    
    NSURL *folderURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/folders/%@?access_token=%@", baseUrl , idenS, idenB, idenF, token]];
    
    
    NSData *folderData = [NSData dataWithContentsOfURL:folderURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:folderData encoding:NSUTF8StringEncoding]);
    NSDictionary *folderDict = [NSJSONSerialization JSONObjectWithData:folderData options:0 error:nil];
    
    if ([folderDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [folderDict valueForKey:@"error"], [folderDict valueForKey:@"error_description"]);
        return f;
    }
    
    [f setDatos:folderDict];
    
    return f;
}

@end
