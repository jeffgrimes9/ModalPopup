//
//  PopupView.m
//  ModalPopup
//
//  Created by Jeff Grimes on 8/22/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//

#import "PopupView.h"

#define shadeTag 1000

@implementation PopupView

const float shadingAlpha = 0.7;
const float transitionDuration = 0.25;

- (id)initWithSuperview:(UIView *)view andMessage:(NSString *)msg {
    if (self = [super init]) {
        self.superview = view;
        self.popupVC = [[[PopupViewController alloc] initWithMessage:msg] autorelease];
        self.bgView = [[[UIView alloc] initWithFrame: view.bounds] autorelease];
    }
    return self;
}

- (void)showPopup {
    [self.superview addSubview:self.bgView];
    [NSTimer scheduledTimerWithTimeInterval:.1
                                     target:self selector:@selector(doPopupTransition) userInfo:nil repeats:NO];
}

- (void)doPopupTransition {
    UIView* holderView = [[[UIView alloc] initWithFrame: CGRectMake(10, 10, 200, 200)] autorelease];
    [self.bgView addSubview: holderView];
    
    // make the new panel
    self.popupCanvas = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bgView.frame.size.width, self.bgView.frame.size.height)] autorelease];
    self.popupCanvas.center = CGPointMake(self.bgView.frame.size.width/2, self.bgView.frame.size.height/2);
    
    [self.popupVC.tipTextLabel sizeToFit];
    
    UIView *popup = [self.popupVC view];
    
    [popup setFrame:CGRectMake(10, 10, popup.frame.size.width/1.5, popup.frame.size.height/2)];
    popup.center = CGPointMake(self.popupCanvas.frame.size.width/2, self.popupCanvas.frame.size.height/2);
    [self.popupCanvas addSubview:popup];
    
    // add the exit button
    int exitButtonOffset = 3;
    UIImage* exitButtonImage = [UIImage imageNamed:@"popupCloseButton.png"];
    UIButton* exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [exitButton setImage:exitButtonImage forState:UIControlStateNormal];
    [exitButton setFrame:CGRectMake(popup.frame.origin.x,
                                    popup.frame.origin.y,
                                    exitButtonImage.size.width,
                                    exitButtonImage.size.height)];
    [exitButton setCenter:CGPointMake(popup.frame.origin.x + popup.frame.size.width - exitButtonOffset, popup.frame.origin.y + exitButtonOffset)];
    [exitButton addTarget:self action:@selector(closePopup) forControlEvents:UIControlEventTouchUpInside];
    [self.popupCanvas addSubview: exitButton];
    
    // dim the page behind the popup
    UIView* shadeView = [[UIView alloc] initWithFrame:self.popupCanvas.frame];
    shadeView.backgroundColor = [UIColor blackColor];
    shadeView.alpha = shadingAlpha;
    shadeView.tag = shadeTag;
    
    [self.popupCanvas addSubview: shadeView];
    [self.popupCanvas sendSubviewToBack: shadeView];
    [shadeView release];
    
    UIViewAnimationOptions options = UIViewAnimationOptionTransitionCrossDissolve |
    UIViewAnimationOptionAllowUserInteraction |
    UIViewAnimationOptionBeginFromCurrentState;
    
    [UIView transitionFromView:holderView toView:self.popupCanvas duration:transitionDuration options:options completion: ^(BOOL finished){}];
}

- (void)closePopup {
    [UIView transitionWithView:self.superview duration:transitionDuration
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^ {
                        for (UIView* childView in self.popupCanvas.subviews) {
                            [childView removeFromSuperview];
                        }
                        
                        for (UIView* childView in self.bgView.subviews) {
                            [childView removeFromSuperview];
                        }
                    }
                    completion:^(BOOL finished) {
                        [self.bgView removeFromSuperview];
                    }];
}

- (void)dealloc {
    self.popupVC = nil;
    self.superview = nil;
    self.bgView = nil;
    self.popupCanvas = nil;
    [super dealloc];
}

@end