//
//  ILPostTweetViewControllerViewController.m
//  TwitterApp
//
//  Created by jeremy Templier on 01/05/12.
//  Copyright (c) 2012 particulier. All rights reserved.
//

#import "ILPostTweetViewControllerViewController.h"

@interface ILPostTweetViewControllerViewController ()

@end

@implementation ILPostTweetViewControllerViewController
@synthesize messageTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setMessageTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark Actions

- (IBAction)imageSwitchPressed:(id)sender 
{
}

- (IBAction)linkSwitchPressed:(id)sender 
{
}

- (IBAction)sendPressed:(id)sender 
{
}

@end
