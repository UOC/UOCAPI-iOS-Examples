//
//  ViewController.h
//  openApi
//
//  Created by UOC on 16/05/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2ViewControllerTouch.h"

@interface ViewController : UIViewController

@property (nonatomic) int loadedAuth;
@property (weak, nonatomic) IBOutlet UILabel *labelError;
@property (nonatomic, strong) GTMOAuth2Authentication *auth;

- (IBAction)acceder:(UIButton *)sender;

@end
