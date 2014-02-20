//
//  TeachingMaterial.m
//  Llibreria
//
//  Created by UOC on 09/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import "TeachingMaterial.h"

@implementation TeachingMaterial

-(void) setDatos:(NSDictionary *)materialDictionary
{
    self.identifier = [materialDictionary objectForKey:@"id"];
    self.type = [materialDictionary objectForKey:@"type"];
    self.title = [materialDictionary objectForKey:@"title"];
    self.url = [materialDictionary objectForKey:@"url"];
}

-(TeachingMaterial *) getClassroomsIdMaterialsId:(NSString *)idenC MaterialId:(NSString *)idenM withToken:(NSString *)token
{
    TeachingMaterial *m = [[TeachingMaterial alloc] init];
    
    NSURL *materialURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@classrooms/%@/materials/%@?access_token=%@", baseUrl , idenC, idenM, token]];
    
    
    NSData *materialData = [NSData dataWithContentsOfURL:materialURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:materialData encoding:NSUTF8StringEncoding]);
    NSDictionary *materialDict = [NSJSONSerialization JSONObjectWithData:materialData options:0 error:nil];
    
    if ([materialDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [materialDict valueForKey:@"error"], [materialDict valueForKey:@"error_description"]);
        return m;
    }
    
    [m setDatos:materialDict];
    
    return m;
}

@end
