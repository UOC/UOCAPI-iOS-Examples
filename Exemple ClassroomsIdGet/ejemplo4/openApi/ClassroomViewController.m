//
//  ClassroomViewController.m
//  classroomsGet
//
//  Created by UOC on 08/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import "ClassroomViewController.h"

@interface ClassroomViewController ()

@end

@implementation ClassroomViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Cal crear l'aula amb la que treballarem.
    self.aula = [[Classroom alloc] init];
    [self carregarAula];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*STARTUOCAPIEXAMPLE*/
-(void) carregarAula
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    /* UOCAPICALL /api/v1/classrooms/{id} GET*/
    // Definim la URL de l'aula.
    NSURL *classroomsURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://oslo.uoc.es:8080/webapps/uocapi/api/v1/classrooms/%@?access_token=%@", self.idAula, self.auth.accessToken]];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        NSData *classroomsData = [NSData dataWithContentsOfURL:classroomsURL];
        //NSLog(@"%@",[[NSString alloc] initWithData:classroomsData encoding:NSUTF8StringEncoding]);
        NSDictionary *classroomsDict = [NSJSONSerialization JSONObjectWithData:classroomsData options:0 error:nil];
        
        if ([classroomsDict valueForKey:@"error"]) {
            NSLog(@"%@: %@", [classroomsDict valueForKey:@"error"], [classroomsDict valueForKey:@"error_description"]);
            return;
        }
        
        [self.aula setDatos:classroomsDict];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // La vista nomes pot ser modificada/actualitzada en la cua principal
            [self mostrarAula];
            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        });
    });
}
/*ENDUOCAPIEXAMPLE*/
-(void) mostrarAula
{
    self.identifier.text    = [[NSString alloc] initWithFormat:@"id aula: %@", self.aula.identifier];
    self.color.text    = [[NSString alloc] initWithFormat:@"color aula: %@", self.aula.color];
    self.titol.text    = [[NSString alloc] initWithFormat:@"títol aula: %@" , self.aula.title];
    self.code.text    = [[NSString alloc] initWithFormat:@"codi aula: %@", self.aula.code];
    self.fatherId.text    = [[NSString alloc] initWithFormat:@"father id: %@", self.aula.fatherId];
    self.shortTitle.text    = [[NSString alloc] initWithFormat:@"sigles: %@", self.aula.shortTitle];
    self.assignments.text = [[NSString alloc] initWithFormat:@"assignments: %@",self.aula.assignments];
}
@end
