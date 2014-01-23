//
//  MessageHistory.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageHistoryDetail.h"

@interface MessageHistory : NSObject

@property (nonatomic, retain) NSString *identifier; // Message's identifier.
@property (nonatomic, retain) NSMutableArray *details; // Action list.

-(void) setDatos:(NSDictionary *)historyDictionary;

@end
