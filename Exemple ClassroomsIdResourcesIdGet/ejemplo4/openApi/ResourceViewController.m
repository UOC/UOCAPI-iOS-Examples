//
//  ResourceViewController.m
//  ejemplo4
//
//  Created by UOC on 16/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "ResourceViewController.h"

@interface ResourceViewController ()

@end

@implementation ResourceViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.recurs = [[Resource alloc]init];
    [self carregarRecurs];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*STARTUOCAPIEXAMPLE*/
-(void) carregarRecurs
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/classrooms/{domain_id}/resources/{id} GET*/
    // Definim la URL per a obtenir les dades del recurs amb la id indicada.
    NSURL *resourcesURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/classrooms/%@/resources/%@?access_token=%@", self.aula.identifier, self.idRecurs, self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *resourcesData = [NSData dataWithContentsOfURL:resourcesURL ];
        NSLog(@"Recurs amb id : %@ - %@" , self.idRecurs , [[NSString alloc]initWithData:resourcesData encoding:NSUTF8StringEncoding]);
        NSDictionary *resourcesDict = [NSJSONSerialization JSONObjectWithData:resourcesData options:0 error:nil];
        
        if ([resourcesDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [resourcesDict valueForKey:@"error"], [resourcesDict valueForKey:@"error_description"]);
            return;
        }
        
        [self.recurs setDatos:resourcesDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // La vista nomes es pot actualitzar en la cua principal.
            [self mostrarRecurs];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void)mostrarRecurs
{
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id recurs: %@", self.recurs.identifier];
    self.type.text    = [[NSString alloc] initWithFormat:@"tipus recurs: %@", self.recurs.type];
    self.subtype.text    = [[NSString alloc] initWithFormat:@"subtipus recurs: %@", self.recurs.subtype];
    self.titol.text    = [[NSString alloc] initWithFormat:@"títol recurs: %@" , self.recurs.title];
    self.code.text    = [[NSString alloc] initWithFormat:@"codi recurs: %@", self.recurs.code];
    self.domainId.text    = [[NSString alloc] initWithFormat:@"id aula: %@", self.recurs.domainId];
}
@end
