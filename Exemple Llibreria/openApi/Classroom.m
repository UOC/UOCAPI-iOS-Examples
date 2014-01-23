//
//  Classroom.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Classroom.h"

@implementation Classroom

- (void) setDatos:(NSDictionary *)classroomDictionary
{
    self.identifier = [classroomDictionary objectForKey:@"id"];
    self.title = [classroomDictionary objectForKey:@"title"];
    self.color = [classroomDictionary objectForKey:@"color"];
    self.fatherId = [classroomDictionary objectForKey:@"fatherId"];
    self.assignments = [classroomDictionary objectForKey:@"assignments"];
    self.code = [classroomDictionary objectForKey:@"code"];
    self.shortTitle = [classroomDictionary objectForKey:@"shortTitle"];
}

@end
