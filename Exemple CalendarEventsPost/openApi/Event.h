//
//  Event.h
//  Ejemplo2
//
//  Created by macoscar on 29/05/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *summary;
@property (nonatomic, retain) NSDate *start;
@property (nonatomic, retain) NSDate *end;

- (void) setDatos:(NSDictionary *)eventDictionary;

@end
