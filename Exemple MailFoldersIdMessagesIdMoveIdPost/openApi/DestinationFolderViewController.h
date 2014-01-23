//
//  DestinationFolderViewController.h
//  MailFoldersIdMessagesIdMoveIdPost
//
//  Created by UOC on 19/08/13.
//  Copyright (c) 2013 Universitat Oberta de Catalunya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTMOAuth2Authentication.h"
#import "Message.h"
#import "Folder.h"

@interface DestinationFolderViewController : UITableViewController

@property (nonatomic, retain) GTMOAuth2Authentication *auth;
@property (nonatomic, retain) Message *message;
@property (nonatomic, retain) NSMutableArray *folders;
@property (nonatomic, retain) Folder *sourceFolder;

@end
