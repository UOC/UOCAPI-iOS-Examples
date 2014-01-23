//
//  MailHistory.h
//  classroomsIdBoardsIdFoldersIdMessagesIdHistoryGet
//
//  Created by UOC on 09/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MailHistory : NSObject

@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *details;

- (void) setDatos:(NSDictionary *)eventDictionary;


@end
