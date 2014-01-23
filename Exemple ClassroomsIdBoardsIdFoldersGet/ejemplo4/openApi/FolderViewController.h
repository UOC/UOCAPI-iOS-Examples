//
//  FolderViewController.h
//  classBoardsFoldersGet
//
//  Created by UOC on 08/08/13.
//  Copyright (c) 2013 UOC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Folder.h"

@interface FolderViewController : UIViewController

@property (nonatomic, retain) Folder *folder;
@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *unread;
@property (weak, nonatomic) IBOutlet UILabel*total;

@end
