//
//  Profile.h
//  Ejemplo1
//
//  Created by UOC on 24/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property (nonatomic, retain) NSString *appId;
@property (nonatomic, retain) NSString *app;
@property (nonatomic, retain) NSString *ident;
@property (nonatomic, retain) NSString *userSubtypeId;
@property (nonatomic, retain) NSString *userType;
@property (nonatomic, retain) NSString *usertypeId;
@property (nonatomic, retain) NSString *userSubtype;
@property (nonatomic, retain) NSString *language;

- (void) setDatos:(NSDictionary *)userDictionary;

@end
