//
//  Board.h
//  ejemplo4
//
//  Created by UOC on 26/07/13.
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
