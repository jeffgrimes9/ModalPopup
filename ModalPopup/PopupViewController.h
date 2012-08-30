//
//  PopupViewController.h
//  ModalPopup
//
//  Created by Jeff Grimes on 8/22/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopupViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *tipTextLabel;
@property (nonatomic, assign) NSString *tipText;

- (id)initWithMessage:(NSString *)msg;

@end