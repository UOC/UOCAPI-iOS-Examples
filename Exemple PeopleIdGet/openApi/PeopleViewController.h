//
//  PeopleViewController.h
//  Ejemplo1
//
//  Created by UOC on 29/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "People.h"
#import "GTMOAuth2Authentication.h"

@interface PeopleViewController : UIViewController

@property (nonatomic, strong) People *people;
@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, assign) BOOL isLoad;
@property (nonatomic, retain) NSString *idPeople;


@property (weak, nonatomic) IBOutlet UILabel *ident;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *surname1;
@property (weak, nonatomic) IBOutlet UILabel *surname2;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *userNumber;
@property (weak, nonatomic) IBOutlet UILabel *hobbies;
@property (weak, nonatomic) IBOutlet UILabel *skills;
@property (weak, nonatomic) IBOutlet UILabel *about;
@property (weak, nonatomic) IBOutlet UILabel *NGOes;
@property (weak, nonatomic) IBOutlet UILabel *languages;
@property (weak, nonatomic) IBOutlet UILabel *secondaryEmail;
@property (weak, nonatomic) IBOutlet UILabel *blog;
@property (weak, nonatomic) IBOutlet UITextView *personalSite;
@property (weak, nonatomic) IBOutlet UILabel *lastUpdate;



@end
