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

- (Folder *) postClassroomsIdBoardsIdMessagesIdMoveId:(NSString *)idenC BoardId:(NSString *)idenB MessageId:(NSString *)idenM Destination:(NSString *)idenDest withToken:(NSString *)token
{
    Folder *f = [[Folder alloc] init];

    NSURL *moveURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/messages/%@/move/%@?access_token=%@", baseUrl, idenC, idenB, idenM, idenDest, token]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:moveURL];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    
    //Fem el request de manera syncrona.
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    NSDictionary *folderDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([folderDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [folderDict valueForKey:@"error"], [folderDict valueForKey:@"error_description"]);
        return f;
    }
    
    // Afegim els valors que ens ha tornat en un material que retornem.
    [f setDatos:folderDict];
    
    return f;
}

- (Folder *) postClassroomsIdBoardsIdFoldersIdMessagesIdMoveId:(NSString *)idenC BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM Destination:(NSString *)idenDest withToken:(NSString *)token
{
    Folder *f = [[Folder alloc] init];
    
    NSURL *moveURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards/%@/folders/%@/messages/%@/move/%@?access_token=%@", baseUrl, idenC, idenB, idenF, idenM, idenDest, token]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:moveURL];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    
    //Fem el request de manera syncrona.
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    NSDictionary *folderDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([folderDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [folderDict valueForKey:@"error"], [folderDict valueForKey:@"error_description"]);
        return f;
    }
    
    // Afegim els valors que ens ha tornat en un material que retornem.
    [f setDatos:folderDict];
    
    return f;
}

- (Folder *) postMailFolders:(Folder *)postFolder withToken:(NSString *)token
{

    //Agafem la carpeta que se'ns ha passat i el posem en un diccionari
    NSDictionary *nouFolder = @{@"id":postFolder.identifier, @"name":postFolder.name, @"unreadMessages":postFolder.unreadMessages, @"totalMessages":postFolder.totalMessages};
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:nouFolder options:NSJSONWritingPrettyPrinted error:nil];
    NSURL *folderURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/folders?access_token=%@", baseUrl, token]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:folderURL];
    
    //Indiquem que el tipus d'accio que voldrem fer sera un POST
    [request setHTTPMethod:@"POST"];
    //El format de les dades estara en json.
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:jsonData];
    
    
    //Fem el request de manera syncrona.
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    Folder *f = [[Folder alloc] init];
    NSDictionary *folderDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([folderDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [folderDict valueForKey:@"error"], [folderDict valueForKey:@"error_description"]);
        return f;
    }
    
    // Afegim els valors que ens ha tornat en una carpeta que retornem.
    [f setDatos:folderDict];
    return f;
}

- (Folder *) postMailMessagesIdMoveId:(NSString *)idenM Destination:(NSString *)idenDest withToken:(NSString *)token
{
    Folder *f = [[Folder alloc] init];
    
    NSURL *moveURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/messages/%@/move/%@?access_token=%@", baseUrl, idenM, idenDest, token]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:moveURL];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    
    //Fem el request de manera syncrona.
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    NSDictionary *folderDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([folderDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [folderDict valueForKey:@"error"], [folderDict valueForKey:@"error_description"]);
        return f;
    }
    
    // Afegim els valors que ens ha tornat en un material que retornem.
    [f setDatos:folderDict];
    
    return f;
}


- (Folder *) postMailFoldersIdMessagesIdMoveId:(NSString *)idenF MessageId:(NSString *)idenM Destination:(NSString *)idenDest withToken:(NSString *)token
{
    Folder *f = [[Folder alloc] init];
    
    NSURL *moveURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@mail/folders/%@/messages/%@/move/%@?access_token=%@", baseUrl, idenF, idenM, idenDest, token]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:moveURL];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    
    //Fem el request de manera syncrona.
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    NSDictionary *folderDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([folderDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [folderDict valueForKey:@"error"], [folderDict valueForKey:@"error_description"]);
        return f;
    }
    
    // Afegim els valors que ens ha tornat en un material que retornem.
    [f setDatos:folderDict];
    
    return f;
}


- (Folder *) postSubjectsIdBoardsIdMessagesIdMoveId:(NSString *)idenS BoardId:(NSString *)idenB MessageId:(NSString *)idenM Destination:(NSString *)idenDest withToken:(NSString *)token
{
    Folder *f = [[Folder alloc] init];
    
    NSURL *moveURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/messages/%@/move/%@?access_token=%@", baseUrl, idenS, idenB, idenM, idenDest, token]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:moveURL];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    
    //Fem el request de manera syncrona.
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    NSDictionary *folderDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([folderDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [folderDict valueForKey:@"error"], [folderDict valueForKey:@"error_description"]);
        return f;
    }
    
    // Afegim els valors que ens ha tornat en un material que retornem.
    [f setDatos:folderDict];
    
    return f;
}

- (Folder *) postSubjectsIdBoardsIdFoldersIdMessagesIdMoveId:(NSString *)idenS BoardId:(NSString *)idenB FolderId:(NSString *)idenF MessageId:(NSString *)idenM Destination:(NSString *)idenDest withToken:(NSString *)token
{
    Folder *f = [[Folder alloc] init];
    
    NSURL *moveURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards/%@/folders/%@/messages/%@/move/%@?access_token=%@", baseUrl, idenS, idenB, idenF, idenM, idenDest, token]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:moveURL];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    
    //Fem el request de manera syncrona.
    NSURLResponse *response;
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:request
                                         returningResponse:&response
                                                     error:&error];
    NSDictionary *folderDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if ([folderDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [folderDict valueForKey:@"error"], [folderDict valueForKey:@"error_description"]);
        return f;
    }
    
    // Afegim els valors que ens ha tornat en un material que retornem.
    [f setDatos:folderDict];
    
    return f;
}

@end
