//
//  Event.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
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

- (Event *) getCalendarEventsId:(NSString *)iden withToken:(NSString *)token{
    
    Event *e = [[Event alloc] init];
    
    NSURL *eventURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@calendar/events/%@?access_token=%@", baseUrl , iden, token]];
    
    
    NSData *eventData = [NSData dataWithContentsOfURL:eventURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:eventData encoding:NSUTF8StringEncoding]);
    NSDictionary *eventDict = [NSJSONSerialization JSONObjectWithData:eventData options:0 error:nil];
        
    if ([eventDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [eventDict valueForKey:@"error"], [eventDict valueForKey:@"error_description"]);
        return e;
    }
        
    [e setDatos:eventDict];
   
    return e;
}

@end
