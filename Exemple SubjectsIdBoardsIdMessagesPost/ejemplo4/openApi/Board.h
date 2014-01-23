//
//  Board.h
//  subjectsIdBoardsGet
//
//  Created by UOC on 13/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Board : NSObject

@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *subtype;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *code;
@property (nonatomic, retain) NSString *domainId;
@property (nonatomic, retain) NSNumber *totalMessages;
@property (nonatomic, retain) NSNumber *unreadMessages;

- (void) setDatos:(NSDictionary *)boardDictionary;

@end
