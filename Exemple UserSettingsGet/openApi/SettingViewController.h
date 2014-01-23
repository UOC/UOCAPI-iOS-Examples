//
//  SettingViewController.h
//  Ejemplo1
//
//  Created by UOC on 24/07/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setting.h"

@interface SettingViewController : UIViewController
@property (nonatomic, strong) Setting *setting;

@property (nonatomic, weak) IBOutlet UILabel *identifier;
@property (nonatomic, weak) IBOutlet UILabel *titol;
@property (nonatomic, weak) IBOutlet UILabel *description;
@property (nonatomic, weak) IBOutlet UILabel *section;
@property (nonatomic, weak) IBOutlet UITextView *url;
@property (nonatomic, weak) IBOutlet UILabel *value;
@property (nonatomic, weak) IBOutlet UITextView *values;

@end
