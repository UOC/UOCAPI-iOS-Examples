//
//  CallViewController.h
//  Exemple Call
//
//  Created by UOC on 03/09/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"

@interface CallViewController : UIViewController

@property(nonatomic, strong) GTMOAuth2Authentication *auth;
@property(nonatomic, retain) IBOutlet UITextField *query;

-(IBAction) openReceptor1;
-(IBAction) openReceptor2;
@end
