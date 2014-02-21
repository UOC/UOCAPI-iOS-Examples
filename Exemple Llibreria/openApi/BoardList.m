//
//  BoardList.m
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "BoardList.h"


@implementation BoardList

- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *boards in [dict objectForKey:@"boards"]) {
        Board *b = [[Board alloc] init];
        [b setDatos:boards];
        [self.boards addObject:b];
    }
}

- (NSMutableArray *) getClassroomsIdBoards:(NSString *)idenC withToken:(NSString *)token
{
    self.boards = [[NSMutableArray alloc] init];
    
    NSURL *boardsURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/boards?access_token=%@", baseUrl, idenC, token]];
    
    NSData *boardsData = [NSData dataWithContentsOfURL:boardsURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:boardsData encoding:NSUTF8StringEncoding]);
    NSDictionary *boardsDict = [NSJSONSerialization JSONObjectWithData:boardsData options:0 error:nil];
        
    if ([boardsDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [boardsDict valueForKey:@"error"], [boardsDict valueForKey:@"error_description"]);
        return self.boards;
    }
        
    [self setDatos:boardsDict];
    
    return self.boards;
}

- (NSMutableArray *) getSubjectsIdBoards:(NSString *)idenS withToken:(NSString *)token
{
    self.boards = [[NSMutableArray alloc] init];
    
    NSURL *boardsURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@subjects/%@/boards?access_token=%@", baseUrl, idenS, token]];
    
    NSData *boardsData = [NSData dataWithContentsOfURL:boardsURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:boardsData encoding:NSUTF8StringEncoding]);
    NSDictionary *boardsDict = [NSJSONSerialization JSONObjectWithData:boardsData options:0 error:nil];
    
    if ([boardsDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [boardsDict valueForKey:@"error"], [boardsDict valueForKey:@"error_description"]);
        return self.boards;
    }
    
    [self setDatos:boardsDict];
    
    return self.boards;
}

@end
