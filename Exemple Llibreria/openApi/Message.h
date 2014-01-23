//
//  Message.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property (nonatomic, retain) NSString *identifier; //Message's identifier.
@property (nonatomic, retain) NSString *subject; //Message's subject.
@property (nonatomic, retain) NSString *snippet; //First characters of the message.
@property (nonatomic, retain) NSString *date; //Message's date.
@property (nonatomic, retain) NSNumber *color; //Color mark of the message.
@property (nonatomic, retain) NSNumber *status; //Message's status.
@property (nonatomic, retain) NSString *from; //Message's sender.
@property (nonatomic, retain) NSString *to; //Message's recipients.
@property (nonatomic, retain) NSString *cc; //Message's copy recipients.
@property (nonatomic, retain) NSString *body; //Message's body.

-(void) setDatos:(NSDictionary *)messageDictionary;

@end
