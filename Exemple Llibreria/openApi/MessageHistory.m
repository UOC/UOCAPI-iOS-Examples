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

-(MessageHistory *) getClassroomsIdBoardsIdFoldersIdMessagesIdHistory:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token
{
    MessageHistory *h = [[MessageHistory alloc] init];
    NSURL *messagehistoryURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/folders/%@/messages/%@/history?access_token=%@", baseUrl , idenC, idenB, idenF, idenM, token]];
    
    NSData *messagehistoryData = [NSData dataWithContentsOfURL:messagehistoryURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagehistoryData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagehistoryDict = [NSJSONSerialization JSONObjectWithData:messagehistoryData options:0 error:nil];
    
    if ([messagehistoryDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagehistoryDict valueForKey:@"error"], [messagehistoryDict valueForKey:@"error_description"]);
        return h;
    }
    
    [h setDatos:messagehistoryDict];
    return h;
}

-(MessageHistory *) getMailMessagesIdHistory:(NSString *)idenM withToken:(NSString *)token
{
    MessageHistory *h = [[MessageHistory alloc] init];
    NSURL *messagehistoryURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/messages/%@/history?access_token=%@", baseUrl, idenM, token]];
    
    NSData *messagehistoryData = [NSData dataWithContentsOfURL:messagehistoryURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagehistoryData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagehistoryDict = [NSJSONSerialization JSONObjectWithData:messagehistoryData options:0 error:nil];
    
    if ([messagehistoryDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagehistoryDict valueForKey:@"error"], [messagehistoryDict valueForKey:@"error_description"]);
        return h;
    }
    
    [h setDatos:messagehistoryDict];
    return h;

}

-(MessageHistory *) getSubjectsIdBoardsIdFoldersIdMessagesIdHistory:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token
{
    MessageHistory *h = [[MessageHistory alloc] init];
    NSURL *messagehistoryURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/folders/%@/messages/%@/history?access_token=%@", baseUrl , idenS, idenB, idenF, idenM, token]];
    
    NSData *messagehistoryData = [NSData dataWithContentsOfURL:messagehistoryURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagehistoryData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagehistoryDict = [NSJSONSerialization JSONObjectWithData:messagehistoryData options:0 error:nil];
    
    if ([messagehistoryDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagehistoryDict valueForKey:@"error"], [messagehistoryDict valueForKey:@"error_description"]);
        return h;
    }
    
    [h setDatos:messagehistoryDict];
    return h;
}

@end
