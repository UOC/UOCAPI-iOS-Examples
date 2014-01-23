//
//  History.h
//  subjectsIdBoardsIdFoldersIdMessagesIdHistoryGet
//
//  Created by UOC on 14/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface History : NSObject

@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *details;

- (void) setDatos:(NSDictionary *)eventDictionary;

@end
