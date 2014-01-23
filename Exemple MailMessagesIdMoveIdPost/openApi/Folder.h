//
//  Folder.h
//  MailMessagesIdMoveIdPost
//
//  Created by UOC on 19/08/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Folder : NSObject

@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *unread;
@property (nonatomic, retain) NSNumber *total;

- (void) setDatos:(NSDictionary *)eventDictionary;


@end
