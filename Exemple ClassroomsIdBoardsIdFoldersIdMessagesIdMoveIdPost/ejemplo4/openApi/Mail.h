//
//  Mail.h
//  Ejemplo4
//
//  Created by pcastells on 11/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mail : NSObject


@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *subject;
@property (nonatomic, retain) NSString *snippet;
@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSNumber *color;
@property (nonatomic, retain) NSNumber *status;
@property (nonatomic, retain) NSString *from;
@property (nonatomic, retain) NSString *to;
@property (nonatomic, retain) NSString *cc;
@property (nonatomic, retain) NSString *body;

- (void) setDatos:(NSDictionary *)eventDictionary;

@end
