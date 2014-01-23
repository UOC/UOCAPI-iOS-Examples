//
//  FolderViewController.h
//  MailFoldersGet
//
//  Created by UOC on 14/08/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Folder.h"

@interface FolderViewController : UIViewController

@property(nonatomic, strong) Folder *folder;
@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *unread;
@property (weak, nonatomic) IBOutlet UILabel *total;

@end
