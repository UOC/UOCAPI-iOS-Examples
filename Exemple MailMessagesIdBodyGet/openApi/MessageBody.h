//
//  MessageBody.h
//  MailMessagesIdBodyGet
//
//  Created by UOC on 19/08/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageBody : NSObject

@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *body;

- (void) setDatos:(NSDictionary *)eventDictionary;


@end
