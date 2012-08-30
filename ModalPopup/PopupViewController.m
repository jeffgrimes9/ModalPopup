//
//  PopupViewController.m
//  ModalPopup
//
//  Created by Jeff Grimes on 8/22/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//

#import "PopupViewController.h"

@implementation PopupViewController

- (id)initWithMessage:(NSString *)msg {
    if (self = [super initWithNibName:@"PopupViewController" bundle:nil]) {
        self.tipText = msg;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tipTextLabel setText:self.tipText];
}

- (void)viewDidUnload {
    self.tipTextLabel = nil;
    [super viewDidUnload];
}

@end