//
//  Resource.h
//  ejemplo4
//
//  Created by UOC on 16/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Resource : NSObject

@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *subtype;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *code;
@property (nonatomic, retain) NSString *domainId;

- (void) setDatos:(NSDictionary *)resourceDictionary;

@end
