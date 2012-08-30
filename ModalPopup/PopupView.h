//
//  PopupView.h
//  ModalPopup
//
//  Created by Jeff Grimes on 8/22/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//  

#import <Foundation/Foundation.h>
#import "PopupViewController.h"

@interface PopupView : NSObject

- (id)initWithSuperview:(UIView *)view andMessage:(NSString *)msg;
- (void)showPopup;

@property (nonatomic, retain) PopupViewController *popupVC;
@property (nonatomic, retain) UIView *superview;
@property (nonatomic, retain) UIView *bgView;
@property (nonatomic, retain) UIView *popupCanvas;

@end