//
//  ViewController.m
//  ModalPopup
//
//  Created by Jeff Grimes on 8/22/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (id)init {
    if (self = [super initWithNibName:@"ViewController" bundle:nil]) {
        self.popupMessage = @"The slider is set to 0";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)sliderValueChanged {
    NSString *sliderValueString = [NSString stringWithFormat:@"%i", (int)self.slider.value];
    self.sliderValueLabel.text = sliderValueString;
    self.popupMessage = [NSString stringWithFormat:@"The slider is set to %i", (int)self.slider.value];
}

- (IBAction)popupButtonTapped {
    self.popup = [[[PopupView alloc] initWithSuperview:self.view andMessage:self.popupMessage] autorelease];
    [self.popup showPopup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    self.popup = nil;
    self.slider = nil;
    self.sliderValueLabel = nil;
    self.popupMessage = nil;
}

@end