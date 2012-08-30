//
//  ViewController.h
//  ModalPopup
//
//  Created by Jeff Grimes on 8/22/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopupView.h"

@interface ViewController : UIViewController

@property (nonatomic, retain) PopupView *popup;
@property (nonatomic, retain) IBOutlet UISlider *slider;
@property (nonatomic, retain) IBOutlet UILabel *sliderValueLabel;
@property (nonatomic, retain) NSString *popupMessage;

- (IBAction)sliderValueChanged;
- (IBAction)popupButtonTapped;

@end