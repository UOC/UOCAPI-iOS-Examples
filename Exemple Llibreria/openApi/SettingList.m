//
//  SettingList.m
//  Llibreria
//
//  Created by UOC on 21/02/14.
//  Copyright (c) 2014 Universitat Oberta de Catalunya. All rights reserved.
//

#import "SettingList.h"

@implementation SettingList

- (void)setDatos:(NSDictionary *)dict
{
    for (NSDictionary *setting in [dict objectForKey:@"settings"]) {
        Setting *s = [[Setting alloc] init];
        [s setDatos:setting];
        [self.settings addObject:s];
    }
}

- (NSMutableArray *) getUserSettings:(NSString *)token
{
    self.settings = [[NSMutableArray alloc] init];
    
    NSURL *settingsURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@user/settings?access_token=%@", baseUrl, token]];
    
    NSData *settingsData = [NSData dataWithContentsOfURL:settingsURL];
    NSLog(@"Data - %@", [[NSString alloc] initWithData:settingsData encoding:NSUTF8StringEncoding]);
    NSDictionary *settingsDict = [NSJSONSerialization JSONObjectWithData:settingsData options:0 error:nil];
    
    if ([settingsDict valueForKey:@"error"]) {
        NSLog(@"%@: %@", [settingsDict valueForKey:@"error"], [settingsDict valueForKey:@"error_description"]);
        return self.settings;
    }
    
    [self setDatos:settingsDict];
    
    return self.settings;
}

@end
