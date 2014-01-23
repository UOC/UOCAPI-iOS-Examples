//
//  MailBody.h
//  classroomsIdBoardsIdFoldersIdMessagesIdBodyGet
//
//  Created by UOC on 09/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MailBody : NSObject

@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *body;

- (void) setDatos:(NSDictionary *)eventDictionary;

@end
