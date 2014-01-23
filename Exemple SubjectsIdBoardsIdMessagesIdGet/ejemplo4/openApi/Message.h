//
//  Message.h
//  subjectsIdBoardsIdMessagesGet
//
//  Created by UOC on 13/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *subject;
@property (nonatomic, retain) NSString *snippet;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSNumber *color;
@property (nonatomic, retain) NSNumber *status;
@property (nonatomic, retain) NSString *from;
@property (nonatomic, retain) NSString *to;
@property (nonatomic, retain) NSString *cc;
@property (nonatomic, retain) NSString *body;

- (void) setDatos:(NSDictionary *)eventDictionary;


@end
