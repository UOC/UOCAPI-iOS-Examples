//
//  People.h
//  Ejemplo1
//
//  Created by UOC on 29/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject
@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *surname1;
@property (nonatomic, retain) NSString *surname2;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSMutableArray *profiles;
@property (nonatomic, retain) NSString *userNumber;
@property (nonatomic, retain) NSString *hobbies;
@property (nonatomic, retain) NSString *skills;
@property (nonatomic, retain) NSString *about;
@property (nonatomic, retain) NSString *NGOes;
@property (nonatomic, retain) NSString *languages;
@property (nonatomic, retain) NSString *secondaryEmail;
@property (nonatomic, retain) NSString *blog;
@property (nonatomic, retain) NSString *personalSite;
@property (nonatomic, retain) NSString *lastUpdate;


- (void) setDatos:(NSDictionary *)peopleDictionary;

@end
