//
//  Body.h
//  subjectsIdBoardsIdFoldersIdMessagesIdBodyGet
//
//  Created by UOC on 14/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Body : NSObject

@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *body;

- (void) setDatos:(NSDictionary *)eventDictionary;


@end
