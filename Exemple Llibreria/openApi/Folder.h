//
//  Folder.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Folder : NSObject

@property (nonatomic, retain) NSString *identifier; //Folder's identifier.
@property (nonatomic, retain) NSString *name; // Folder's name.
@property (nonatomic, retain) NSNumber *unreadMessages; // Number of unread messages.
@property (nonatomic, retain) NSNumber *totalMessages; // Number of messages.

-(void) setDatos:(NSDictionary *)folderDictionary;

@end
