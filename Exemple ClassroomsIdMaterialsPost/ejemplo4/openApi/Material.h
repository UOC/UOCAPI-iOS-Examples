//
//  Material.h
//  ejemplo4
//
//  Created by UOC on 26/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Material : NSObject

@property (nonatomic, retain) NSString *identifier;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *url;

- (void) setDatos:(NSDictionary *)materialDictionary;

@end
