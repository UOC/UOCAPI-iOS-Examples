//
//  MenuViewController.h
//  openApi
//
//  Created by UOC on 16/05/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "User.h"
#import "Event.h"

@interface UserViewController : UIViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, strong) User *user;

@property (weak, nonatomic) IBOutlet UIImageView *imagenUser;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *fullname;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *ident;
@property (weak, nonatomic) IBOutlet UILabel *languages;
@property (weak, nonatomic) IBOutlet UILabel *sessionId;


@end
