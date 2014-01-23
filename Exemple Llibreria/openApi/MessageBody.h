//
//  MessageBody.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageBody : NSObject

@property (nonatomic, retain) NSString *identifier; //Message's identifier.
@property (nonatomic, retain) NSString *body; //Message's body.

-(void) setDatos:(NSDictionary *) bodyDictionary;

@end
