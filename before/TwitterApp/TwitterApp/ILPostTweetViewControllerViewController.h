//
//  ILPostTweetViewControllerViewController.h
//  TwitterApp
//
//  Created by jeremy Templier on 01/05/12.
//  Copyright (c) 2012 particulier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ILPostTweetViewControllerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;

- (IBAction)imageSwitchPressed:(id)sender;
- (IBAction)linkSwitchPressed:(id)sender;
- (IBAction)sendPressed:(id)sender;
@end
