//
//  Classroom.h
//  ejemplo4
//
//  Created by UOC on 16/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Classroom : NSObject

@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *color;
@property (nonatomic, retain) NSString *fatherId;
@property (nonatomic, retain) NSMutableArray *assignments;
@property (nonatomic, retain) NSString *code;
@property (nonatomic, retain) NSString *shortTitle;

- (void) setDatos:(NSDictionary *)classroomDictionary;

@end
