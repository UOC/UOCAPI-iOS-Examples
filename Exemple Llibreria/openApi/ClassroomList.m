//
//  ClassroomList.m
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "ClassroomList.h"

@implementation ClassroomList

- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *classrooms in [dict objectForKey:@"classrooms"]) {
        Classroom *c = [[Classroom alloc] init];
        [c setDatos:classrooms];
        [self.classrooms addObject:c];
    }
}

- (NSMutableArray *) getClassrooms:(NSString *)token
{
    self.classrooms = [[NSMutableArray alloc] init];
    
    NSURL *classroomsURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms?access_token=%@", baseUrl, token]];
    
    NSData *classroomsData = [NSData dataWithContentsOfURL:classroomsURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:classroomsData encoding:NSUTF8StringEncoding]);
    NSDictionary *classroomsDict = [NSJSONSerialization JSONObjectWithData:classroomsData options:0 error:nil];
    
    if ([classroomsDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [classroomsDict valueForKey:@"error"], [classroomsDict valueForKey:@"error_description"]);
        return self.classrooms;
    }
    
    [self setDatos:classroomsDict];
    
    return self.classrooms;
}

- (NSMutableArray *) getClassroomsIdGroups:(NSString *)idenC withToken:(NSString *)token
{
    self.classrooms = [[NSMutableArray alloc] init];
    
    NSURL *classroomsURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/groups?access_token=%@", baseUrl, idenC, token]];
    
    NSData *classroomsData = [NSData dataWithContentsOfURL:classroomsURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:classroomsData encoding:NSUTF8StringEncoding]);
    NSDictionary *classroomsDict = [NSJSONSerialization JSONObjectWithData:classroomsData options:0 error:nil];
    
    if ([classroomsDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [classroomsDict valueForKey:@"error"], [classroomsDict valueForKey:@"error_description"]);
        return self.classrooms;
    }
    
    [self setDatos:classroomsDict];
    
    return self.classrooms;
}

@end
