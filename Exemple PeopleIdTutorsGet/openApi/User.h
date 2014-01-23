//
//  User.h
//  openApi
//
//  Created by Oscar Iglesias Lopez on 17/05/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *number;
@property (nonatomic, retain) NSString *fullname;
@property (nonatomic, retain) NSString *language;
@property (nonatomic, retain) NSString *sessionID;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) UIImage *photo;

- (void) setDatos:(NSDictionary *)userDictionary;

@end
