//
//  Event.m
//  Ejemplo2
//
//  Created by macoscar on 29/05/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "Event.h"

@implementation Event

- (void) setDatos:(NSDictionary *)eventDictionary
{
    self.identifier = [eventDictionary objectForKey:@"id"];
    self.url        = [eventDictionary objectForKey:@"url"];
    self.summary    = [eventDictionary objectForKey:@"summary"];
    self.start      = [self parserDate:[eventDictionary objectForKey:@"start"]];
    self.end        = [self parserDate:[eventDictionary objectForKey:@"end"]];
}

- (NSDate *)parserDate:(NSString *)dateString
{
    [NSDateFormatter setDefaultFormatterBehavior:NSDateFormatterBehavior10_4];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSSz"];
    
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:dateString];
    
    return dateFromString;
}

@end