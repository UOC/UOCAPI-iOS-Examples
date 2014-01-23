//
//  MaterialViewController.h
//  ejemplo4
//
//  Created by UOC on 26/07/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Material.h"
#import "GTMOAuth2Authentication.h"
#import "Classroom.h"

@interface MaterialViewController : UIViewController

@property (nonatomic, strong) Material *material;
@property (nonatomic, retain) Classroom *aula;
@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) NSString *idMat;

@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *titol;
@property (weak, nonatomic) IBOutlet UITextView *url;

@end
