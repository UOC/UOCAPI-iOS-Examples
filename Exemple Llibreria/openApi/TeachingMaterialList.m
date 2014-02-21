//
//  TeachingMaterialList.m
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "TeachingMaterialList.h"

@implementation TeachingMaterialList

- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *material in [dict objectForKey:@"materials"]) {
        TeachingMaterial *m = [[TeachingMaterial alloc] init];
        [m setDatos:material];
        [self.materials addObject:m];
    }
}

- (NSMutableArray *) getClassroomsIdMaterials:(NSString *)idenC withToken:(NSString *)token
{
    self.materials = [[NSMutableArray alloc] init];
    
    NSURL *materialsURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/materials?access_token=%@", baseUrl, idenC, token]];
    
    NSData *materialsData = [NSData dataWithContentsOfURL:materialsURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:materialsData encoding:NSUTF8StringEncoding]);
    NSDictionary *materialsDict = [NSJSONSerialization JSONObjectWithData:materialsData options:0 error:nil];
    
    if ([materialsDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [materialsDict valueForKey:@"error"], [materialsDict valueForKey:@"error_description"]);
        return self.materials;
    }
    
    [self setDatos:materialsDict];
    
    return self.materials;
}

@end
