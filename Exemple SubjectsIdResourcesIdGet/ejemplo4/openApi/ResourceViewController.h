//
//  ResourceViewController.h
//  subjectsIdResourcesGet
//
//  Created by UOC on 13/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Resource.h"
#import "GTMOAuth2Authentication.h"
#import "Classroom.h"


@interface ResourceViewController : UIViewController

@property (nonatomic, strong) Resource *recurs;
@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) Classroom *aula;
@property (nonatomic, retain) NSString *idRecurs;

@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *subtype;
@property (weak, nonatomic) IBOutlet UILabel *titol;
@property (weak, nonatomic) IBOutlet UILabel *code;
@property (weak, nonatomic) IBOutlet UILabel *domainId;


@end
