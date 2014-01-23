//
//  ProfileViewController.h
//  Ejemplo1
//
//  Created by UOC on 24/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"

@interface ProfileViewController : UIViewController

@property (nonatomic, strong) Profile *profile;

@property (weak, nonatomic) IBOutlet UILabel *appId;
@property (weak, nonatomic) IBOutlet UILabel *app;
@property (weak, nonatomic) IBOutlet UILabel *Id;
@property (weak, nonatomic) IBOutlet UILabel *userSubtypeId;
@property (weak, nonatomic) IBOutlet UILabel *userType;
@property (weak, nonatomic) IBOutlet UILabel *usertypeId;
@property (weak, nonatomic) IBOutlet UILabel *userSubtype;
@property (weak, nonatomic) IBOutlet UILabel *language;

@end
