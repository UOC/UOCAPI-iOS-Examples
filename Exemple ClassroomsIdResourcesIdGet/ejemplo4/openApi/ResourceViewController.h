//
//  ResourceViewController.h
//  ejemplo4
//
//  Created by UOC on 16/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Resource.h"
#import "Classroom.h"
#import "GTMOAuth2Authentication.h"

@interface ResourceViewController : UIViewController

@property (nonatomic, strong) Resource *recurs;
@property (nonatomic, retain) NSString *idRecurs;
@property (nonatomic, retain) Classroom *aula;
@property (nonatomic, retain) GTMOAuth2Authentication *auth;

@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *subtype;
@property (weak, nonatomic) IBOutlet UILabel *titol;
@property (weak, nonatomic) IBOutlet UILabel *code;
@property (weak, nonatomic) IBOutlet UILabel *domainId;


@end
