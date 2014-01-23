//
//  Resource.h
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Resource : NSObject

@property (nonatomic, retain) NSString *identifier; //Resource's identifier.
@property (nonatomic, retain) NSString *type; //
@property (nonatomic, retain) NSString *subtype; //Subtype of resource.
@property (nonatomic, retain) NSString *title; //Resource's title.
@property (nonatomic, retain) NSString *code; //Resource's code. Used to compose the resource's URL
@property (nonatomic, retain) NSString *domainId; //Identifier of the classroom where this resource is in.

-(void) setDatos:(NSDictionary *) resourceDictionary;

@end
