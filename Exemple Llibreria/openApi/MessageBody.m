//
//  MessageBody.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "MessageBody.h"

@implementation MessageBody

-(void) setDatos:(NSDictionary *)bodyDictionary
{
    self.identifier = [bodyDictionary objectForKey:@"id"];
    self.body = [bodyDictionary objectForKey:@"body"];
}

-(MessageBody *) getClassroomsIdBoardsIdFoldersIdMessagesIdBody:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token
{
    MessageBody *b = [[MessageBody alloc] init];
    NSURL *messagebodyURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/folders/%@/messages/%@/body?access_token=%@", baseUrl , idenC, idenB, idenF, idenM, token]];

    NSData *messagebodyData = [NSData dataWithContentsOfURL:messagebodyURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagebodyData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagebodyDict = [NSJSONSerialization JSONObjectWithData:messagebodyData options:0 error:nil];
    
    if ([messagebodyDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagebodyDict valueForKey:@"error"], [messagebodyDict valueForKey:@"error_description"]);
        return b;
    }
    
    [b setDatos:messagebodyDict];
    return b;
}

-(MessageBody *) getMailMessagesIdBody:(NSString *)idenM withToken:(NSString *)token
{
    MessageBody *b = [[MessageBody alloc] init];
    NSURL *messagebodyURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/messages/%@/body?access_token=%@", baseUrl ,  idenM, token]];
    
    NSData *messagebodyData = [NSData dataWithContentsOfURL:messagebodyURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagebodyData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagebodyDict = [NSJSONSerialization JSONObjectWithData:messagebodyData options:0 error:nil];
    
    if ([messagebodyDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagebodyDict valueForKey:@"error"], [messagebodyDict valueForKey:@"error_description"]);
        return b;
    }
    
    [b setDatos:messagebodyDict];
    return b;
}


-(MessageBody *) getSubjectsIdBoardsIdFoldersIdMessagesIdBody:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM withToken:(NSString *)token
{
    MessageBody *b = [[MessageBody alloc] init];
    NSURL *messagebodyURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/folders/%@/messages/%@/body?access_token=%@", baseUrl , idenS, idenB, idenF, idenM, token]];
    
    NSData *messagebodyData = [NSData dataWithContentsOfURL:messagebodyURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:messagebodyData encoding:NSUTF8StringEncoding]);
    NSDictionary *messagebodyDict = [NSJSONSerialization JSONObjectWithData:messagebodyData options:0 error:nil];
    
    if ([messagebodyDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [messagebodyDict valueForKey:@"error"], [messagebodyDict valueForKey:@"error_description"]);
        return b;
    }
    
    [b setDatos:messagebodyDict];
    return b;
}
@end
