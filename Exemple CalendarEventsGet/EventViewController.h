//
//  EventViewController.h
//  Ejemplo2
//
//  Created by macoscar on 05/06/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"


@interface EventViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (weak, nonatomic) IBOutlet UITextView *url;
@property (weak, nonatomic) IBOutlet UILabel *start;
@property (weak, nonatomic) IBOutlet UILabel *end;

@property (nonatomic, retain) Event *evento;



@end
