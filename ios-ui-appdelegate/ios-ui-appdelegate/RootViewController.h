//
//  RootViewController.h
//  ios-ui-appdelegate
//
//  Created by john on 19/7/6.
//  Copyright © 2019年 future. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (nonatomic, retain) IBOutlet UILabel *buttonPressLabel;
@property (nonatomic, retain) IBOutlet UILabel *echoLabel;
@property (nonatomic, assign) int buttonPressedCount;

- (IBAction)simpleButtonPressed:(id) sender;
- (IBAction)textFieldTextDidChange:(id)sender;

@end
