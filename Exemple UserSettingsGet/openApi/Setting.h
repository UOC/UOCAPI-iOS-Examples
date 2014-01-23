//
//  Setting.h
//  Ejemplo1
//
//  Created by UOC on 24/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Setting : NSObject
@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *section;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *value;
@property (nonatomic, retain) NSString *values;

- (void) setDatos:(NSDictionary *)userDictionary;

@end
