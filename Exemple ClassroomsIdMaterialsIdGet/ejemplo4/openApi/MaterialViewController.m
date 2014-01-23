//
//  MaterialViewController.m
//  ejemplo4
//
//  Created by UOC on 26/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "MaterialViewController.h"

@interface MaterialViewController ()

@end

@implementation MaterialViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.material = [[Material alloc] init];
    [self carregarMaterial];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*STARTUOCAPIEXAMPLE*/
- (void) carregarMaterial
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // Definim la URL per obtenir les dades d'un material en concret.
    /* UOCAPICALL /api/v1/classrooms/{domain_id}/materials/{id} GET*/
    NSURL *matURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/classrooms/%@/materials/%@?access_token=%@", self.aula.identifier, self.idMat, self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *matData = [NSData dataWithContentsOfURL:matURL ];
        NSLog(@"Data mat amb id = %@ - %@",self.idMat,[[NSString alloc]initWithData:matData encoding:NSUTF8StringEncoding]);
        NSDictionary *matDict = [NSJSONSerialization JSONObjectWithData:matData options:0 error:nil];
        
        if ([matDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [matDict valueForKey:@"error"], [matDict valueForKey:@"error_description"]);
            return;
        }
        
        [self.material setDatos:matDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Per actualitzar la vista cal estar en la cua principal.
            [self mostraMaterial];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
- (void) mostraMaterial
{
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id material: %@", self.material.identifier];
    self.type.text    = [[NSString alloc] initWithFormat:@"tipus material: %@", self.material.type];
    self.titol.text    = [[NSString alloc] initWithFormat:@"títol: %@" , self.material.title];
    self.url.text    = [[NSString alloc] initWithFormat:@"%@", self.material.url];
}
@end
