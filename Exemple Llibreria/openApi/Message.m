//
//  Message.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Message.h"

@implementation Message

-(void) setDatos:(NSDictionary *)messageDictionary
{
    self.identifier = [messageDictionary objectForKey:@"id"];
    self.subject = [messageDictionary objectForKey:@"subject"];
    self.snippet = [messageDictionary objectForKey:@"snippet"];
    self.date = [messageDictionary objectForKey:@"date"];
    self.color = [messageDictionary objectForKey:@"color"];
    self.status = [messageDictionary objectForKey:@"status"];
    self.from = [messageDictionary objectForKey:@"from"];
    self.to = [messageDictionary objectForKey:@"to"];
    self.cc = [messageDictionary objectForKey:@"cc"];
    self.body = [messageDictionary objectForKey:@"body"];
}



-(Message *) getClassroomIdBoardsIdMessagesId:(NSString *)idenC BoardId:(NSString *)idenB MessageId:(NSString *)idenM withToken:(NSString *)token
{
    Message *m = [[Message alloc] init];
    
    NSURL *messageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/messages/%@?access_token=%@", baseUrl , idenC, idenB, idenM, token]];
    
    
    NSData *messageData = [NSData dataWithContentsOfURL:messageURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messageData encoding:NSUTF8StringEncoding]);
    NSDictionary *messageDict = [NSJSONSerialization JSONObjectWithData:messageData options:0 error:nil];
    
    if ([messageDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messageDict valueForKey:@"error"], [messageDict valueForKey:@"error_description"]);
        return m;
    }
    
    [m setDatos:messageDict];
    
    return m;
}

-(Message *) getClassroomIdBoardsIdFoldersIdMessagesId:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token
{
    Message *m = [[Message alloc] init];
    
    NSURL *messageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/folders/%@/messages/%@?access_token=%@", baseUrl , idenC, idenB, idenF, idenM, token]];
    
    
    NSData *messageData = [NSData dataWithContentsOfURL:messageURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messageData encoding:NSUTF8StringEncoding]);
    NSDictionary *messageDict = [NSJSONSerialization JSONObjectWithData:messageData options:0 error:nil];
    
    if ([messageDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messageDict valueForKey:@"error"], [messageDict valueForKey:@"error_description"]);
        return m;
    }
    
    [m setDatos:messageDict];
    
    return m;
}

-(Message *) getMailMessagesId:(NSString *)idenM withToken:(NSString *)token
{
    Message *m = [[Message alloc] init];
    
    NSURL *messageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/messages/%@?access_token=%@", baseUrl , idenM, token]];
    
    
    NSData *messageData = [NSData dataWithContentsOfURL:messageURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messageData encoding:NSUTF8StringEncoding]);
    NSDictionary *messageDict = [NSJSONSerialization JSONObjectWithData:messageData options:0 error:nil];
    
    if ([messageDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messageDict valueForKey:@"error"], [messageDict valueForKey:@"error_description"]);
        return m;
    }
    
    [m setDatos:messageDict];
    
    return m;
}

-(Message *) getSubjectsIdBoardsIdMessagesId:(NSString *)idenS BoardId:(NSString *)idenB MessageId:(NSString *)idenM withToken:(NSString *)token
{
    Message *m = [[Message alloc] init];
    
    NSURL *messageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/messages/%@?access_token=%@", baseUrl , idenS, idenB, idenM, token]];
    
    
    NSData *messageData = [NSData dataWithContentsOfURL:messageURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messageData encoding:NSUTF8StringEncoding]);
    NSDictionary *messageDict = [NSJSONSerialization JSONObjectWithData:messageData options:0 error:nil];
    
    if ([messageDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messageDict valueForKey:@"error"], [messageDict valueForKey:@"error_description"]);
        return m;
    }
    
    [m setDatos:messageDict];
    
    return m;
}

-(Message *) getSubjectsIdBoardsIdFoldersIdMessagesId:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token
{
    Message *m = [[Message alloc] init];
    
    NSURL *messageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/folders/%@/messages/%@?access_token=%@", baseUrl , idenS, idenB, idenF, idenM, token]];
    
    
    NSData *messageData = [NSData dataWithContentsOfURL:messageURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messageData encoding:NSUTF8StringEncoding]);
    NSDictionary *messageDict = [NSJSONSerialization JSONObjectWithData:messageData options:0 error:nil];
    
    if ([messageDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messageDict valueForKey:@"error"], [messageDict valueForKey:@"error_description"]);
        return m;
    }
    
    [m setDatos:messageDict];
    
    return m;
}

@end
