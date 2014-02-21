//
//  MessageList.m
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MessageList.h"

@implementation MessageList

- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *message in [dict objectForKey:@"messages"]) {
        Message *m = [[Message alloc] init];
        [m setDatos:message];
        [self.messages addObject:m];
    }
}

- (NSMutableArray *) getClassroomsIdBoardsIdMessages:(NSString *)idenC BoardId:(NSString *)idenB withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/messages?access_token=%@", baseUrl,idenC, idenB, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}

- (NSMutableArray *) getClassroomsIdBoardsIdMessagesUnread:(NSString *)idenC BoardId:(NSString *)idenB withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/messages/unread?access_token=%@", baseUrl,idenC, idenB, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}

- (NSMutableArray *) getClassroomsIdBoardsIdFoldersIdMessages:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/folders/%@/messages?access_token=%@", baseUrl,idenC, idenB, idenF, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}

- (NSMutableArray *) getClassroomsIdBoardsIdFoldersIdMessagesUnread:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/folders/%@/messages/unread?access_token=%@", baseUrl,idenC, idenB, idenF, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}

- (NSMutableArray *) getMailMessages:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/messages?access_token=%@", baseUrl, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}

- (NSMutableArray *) getMailMessagesUnread:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/messages/unread?access_token=%@", baseUrl, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}

- (NSMutableArray *) getMailFoldersIdMessages:(NSString *)idenF withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/folders/%@/messages?access_token=%@", baseUrl, idenF,token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}

- (NSMutableArray *) getMailFoldersIdMessagesUnread:(NSString *)idenF withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/folders/%@/messages/unread?access_token=%@", baseUrl, idenF,token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}

- (NSMutableArray *) getSubjectsIdBoardsIdMessages:(NSString *)idenS BoardId:(NSString *)idenB withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/messages?access_token=%@", baseUrl, idenS, idenB, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}

- (NSMutableArray *) getSubjectsIdBoardsIdMessagesUnread:(NSString *)idenS BoardId:(NSString *)idenB withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/messages/unread?access_token=%@", baseUrl, idenS, idenB, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}

- (NSMutableArray *) getSubjectsIdBoardsIdFoldersIdMessages:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/folders/%@/messages?access_token=%@", baseUrl, idenS, idenB, idenF, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}

- (NSMutableArray *) getSubjectsIdBoardsIdFoldersIdMessagesUnread:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF withToken:(NSString *)token
{
    self.messages = [[NSMutableArray alloc] init];
    
    NSURL *messagesURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/folders/%@/messages/unread?access_token=%@", baseUrl, idenS, idenB, idenF, token]];
    
    NSData *messagesData = [NSData dataWithContentsOfURL:messagesURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagesData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagesDict = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:nil];
    
    if ([messagesDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagesDict valueForKey:@"error"], [messagesDict valueForKey:@"error_description"]);
        return self.messages;
    }
    
    [self setDatos:messagesDict];
    
    return self.messages;
}

@end
