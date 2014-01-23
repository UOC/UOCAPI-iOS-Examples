//
//  Details.h
//  classroomsIdBoardsIdFoldersIdMessagesIdHistoryGet
//
//  Created by UOC on 09/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Details : NSObject

@property (nonatomic, retain) NSString *action;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *time;

- (void) setDatos:(NSDictionary *)eventDictionary;


@end
